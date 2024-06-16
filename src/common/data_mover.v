//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 22-Mar-24  DWW     1  Initial creation
//====================================================================================

/*
    This moves a block of data from a source AXI-MM interface to a destination
    AXI-MM interface.

    Data widths of the two interfaces must match.
*/


module data_mover #
(
    parameter DW                = 512,
    parameter AW                = 64,
    parameter BYTE_COUNT        = 1024 * 1024,
    parameter BURST_SIZE        = 4096,
    parameter[63:0] SRC_ADDRESS = 64'h0000_0000
)
(
    input       clk, resetn,
    input[63:0] dest_address,
    input       start,

    //=================  This is the source AXI4-master interface  ================

    // "Specify write address"              -- Master --    -- Slave --
    output     [AW-1:0]                     SRC_AXI_AWADDR,
    output                                  SRC_AXI_AWVALID,
    output     [7:0]                        SRC_AXI_AWLEN,
    output     [2:0]                        SRC_AXI_AWSIZE,
    output     [3:0]                        SRC_AXI_AWID,
    output     [1:0]                        SRC_AXI_AWBURST,
    output                                  SRC_AXI_AWLOCK,
    output     [3:0]                        SRC_AXI_AWCACHE,
    output     [3:0]                        SRC_AXI_AWQOS,
    output     [2:0]                        SRC_AXI_AWPROT,
    input                                                   SRC_AXI_AWREADY,

    // "Write Data"                         -- Master --    -- Slave --
    output     [DW-1:0]                     SRC_AXI_WDATA,
    output     [(DW/8)-1:0]                 SRC_AXI_WSTRB,
    output                                  SRC_AXI_WVALID,
    output                                  SRC_AXI_WLAST,
    input                                                   SRC_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    input[1:0]                                              SRC_AXI_BRESP,
    input                                                   SRC_AXI_BVALID,
    output                                  SRC_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    output reg [AW-1:0]                     SRC_AXI_ARADDR,
    output reg                              SRC_AXI_ARVALID,
    output     [2:0]                        SRC_AXI_ARPROT,
    output                                  SRC_AXI_ARLOCK,
    output     [3:0]                        SRC_AXI_ARID,
    output     [7:0]                        SRC_AXI_ARLEN,
    output     [1:0]                        SRC_AXI_ARBURST,
    output     [3:0]                        SRC_AXI_ARCACHE,
    output     [3:0]                        SRC_AXI_ARQOS,
    input                                                   SRC_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    input[DW-1:0]                                           SRC_AXI_RDATA,
    input                                                   SRC_AXI_RVALID,
    input[1:0]                                              SRC_AXI_RRESP,
    input                                                   SRC_AXI_RLAST,
    output                                  SRC_AXI_RREADY,
    //==========================================================================


    //============= This is the destination AXI4-master interface  =============

    // "Specify write address"              -- Master --    -- Slave --
    output reg [AW-1:0]                     DST_AXI_AWADDR,
    output reg                              DST_AXI_AWVALID,
    output     [7:0]                        DST_AXI_AWLEN,
    output     [2:0]                        DST_AXI_AWSIZE,
    output     [3:0]                        DST_AXI_AWID,
    output     [1:0]                        DST_AXI_AWBURST,
    output                                  DST_AXI_AWLOCK,
    output     [3:0]                        DST_AXI_AWCACHE,
    output     [3:0]                        DST_AXI_AWQOS,
    output     [2:0]                        DST_AXI_AWPROT,
    input                                                   DST_AXI_AWREADY,

    // "Write Data"                         -- Master --    -- Slave --
    output     [DW-1:0]                     DST_AXI_WDATA,
    output     [(DW/8)-1:0]                 DST_AXI_WSTRB,
    output                                  DST_AXI_WVALID,
    output                                  DST_AXI_WLAST,
    input                                                   DST_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    input[1:0]                                              DST_AXI_BRESP,
    input                                                   DST_AXI_BVALID,
    output                                  DST_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    output[AW-1:0]                          DST_AXI_ARADDR,
    output                                  DST_AXI_ARVALID,
    output[2:0]                             DST_AXI_ARPROT,
    output                                  DST_AXI_ARLOCK,
    output[3:0]                             DST_AXI_ARID,
    output[7:0]                             DST_AXI_ARLEN,
    output[1:0]                             DST_AXI_ARBURST,
    output[3:0]                             DST_AXI_ARCACHE,
    output[3:0]                             DST_AXI_ARQOS,
    input                                                   DST_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    input[DW-1:0]                                           DST_AXI_RDATA,
    input                                                   DST_AXI_RVALID,
    input[1:0]                                              DST_AXI_RRESP,
    input                                                   DST_AXI_RLAST,
    output                                  DST_AXI_RREADY
    //==========================================================================
);

// Compute the geometry of our data movement
localparam CYCLES_PER_BURST = BURST_SIZE / (DW/8);
localparam BURSTS_PER_MOVE  = BYTE_COUNT / BURST_SIZE;

// State machine states
reg arsm_state;  // AR-channel of SRC_AXI
reg awsm_state;  // AW-channel of DST_AXI
reg wsm_state;   // W_channel  of DST_AXI

// These count bursts for each of the state machines
reg[31:0] ar_count, aw_count, w_count;

// We're always ready to receive write-acknowledgements
assign DST_AXI_BREADY = 1;

//=============================================================================
// This block sends read-requests to the SRC_AXI interace
//=============================================================================
assign SRC_AXI_ARBURST = 1;
assign SRC_AXI_ARLEN   = CYCLES_PER_BURST - 1 ;
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (resetn == 0) begin
        arsm_state      <= 0;
        SRC_AXI_ARVALID <= 0;
    end else case (arsm_state)

        0:  if (start) begin
                ar_count        <= 1;
                SRC_AXI_ARADDR  <= SRC_ADDRESS;
                SRC_AXI_ARVALID <= 1;
                arsm_state      <= 1;
            end

        1:  if (SRC_AXI_ARREADY & SRC_AXI_ARVALID) begin
                if (ar_count == BURSTS_PER_MOVE) begin
                    SRC_AXI_ARVALID <= 0;
                    arsm_state      <= 0;
                end begin
                    SRC_AXI_ARADDR  <= SRC_AXI_ARADDR + BURST_SIZE;
                    ar_count        <= ar_count + 1; 
                end
            end

    endcase
end
//============================================================================



//=============================================================================
// This block sends write-requests to the DST_AXI interace
//=============================================================================
assign DST_AXI_AWBURST = 1;
assign DST_AXI_AWLEN   = CYCLES_PER_BURST - 1 ;
assign DST_AXI_AWSIZE  = $clog2(DW/8);
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (resetn == 0) begin
        awsm_state      <= 0;
        DST_AXI_AWVALID <= 0;
    end else case (awsm_state)

        0:  if (start) begin
                aw_count        <= 1;
                DST_AXI_AWADDR  <= dest_address;
                DST_AXI_AWVALID <= 1;
                awsm_state      <= 1;
            end

        1:  if (DST_AXI_AWREADY & DST_AXI_AWVALID) begin
                if (aw_count == BURSTS_PER_MOVE) begin
                    DST_AXI_AWVALID <= 0;
                    awsm_state      <= 0;
                end begin
                    DST_AXI_AWADDR  <= DST_AXI_AWADDR + BURST_SIZE;
                    aw_count        <= aw_count + 1; 
                end
            end

    endcase
end
//============================================================================


//============================================================================
// The W-channel of DST_AXI is fed directly from the R-channel of SRC_AXI
//============================================================================
assign DST_AXI_WDATA  = SRC_AXI_RDATA;
assign DST_AXI_WSTRB  = -1;
assign DST_AXI_WLAST  = SRC_AXI_RLAST;
assign DST_AXI_WVALID = SRC_AXI_RVALID & (wsm_state == 1);
assign SRC_AXI_RREADY = DST_AXI_WREADY & (wsm_state == 1);
//============================================================================


//============================================================================
// This keeps track of the data-bursts as they are emitted on the W-channel
// of interface DST_AXI
//============================================================================
always @(posedge clk) begin

    if (resetn == 0) begin
        wsm_state <= 0;
    end else case(wsm_state)

        0:  if (start) begin
                w_count   <= 1;
                wsm_state <= 1;
            end

        1:  if (DST_AXI_WREADY & DST_AXI_WVALID & DST_AXI_WLAST) begin
                if (w_count == BURSTS_PER_MOVE)
                    wsm_state <= 0;
                else
                    w_count   <= w_count + 1;
            end

    endcase

end
//============================================================================


endmodule