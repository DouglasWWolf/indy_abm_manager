module ram_reader #
(

    parameter DW = 512,
    parameter AW = 16,
    parameter FIRST_DATA = 32'h8000_0000

)
(
    input   clk, resetn,

    input        start,
    input[31:0]  first_address,

    //=================  This is the main AXI4-master interface  ================

    // "Specify write address"              -- Master --    -- Slave --
    output reg [AW-1:0]                     M_AXI_AWADDR,
    output reg                              M_AXI_AWVALID,
    output     [7:0]                        M_AXI_AWLEN,
    output     [2:0]                        M_AXI_AWSIZE,
    output     [3:0]                        M_AXI_AWID,
    output     [1:0]                        M_AXI_AWBURST,
    output                                  M_AXI_AWLOCK,
    output     [3:0]                        M_AXI_AWCACHE,
    output     [3:0]                        M_AXI_AWQOS,
    output     [2:0]                        M_AXI_AWPROT,

    input                                                   M_AXI_AWREADY,

    // "Write Data"                         -- Master --    -- Slave --
    output reg [DW-1:0]                     M_AXI_WDATA,
    output     [(DW/8)-1:0]                 M_AXI_WSTRB,
    output reg                              M_AXI_WVALID,
    output                                  M_AXI_WLAST,
    input                                                   M_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    input[1:0]                                              M_AXI_BRESP,
    input                                                   M_AXI_BVALID,
    output                                  M_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    output     [AW-1:0]                     M_AXI_ARADDR,
    output reg                              M_AXI_ARVALID,
    output     [2:0]                        M_AXI_ARPROT,
    output                                  M_AXI_ARLOCK,
    output     [3:0]                        M_AXI_ARID,
    output     [7:0]                        M_AXI_ARLEN,
    output     [1:0]                        M_AXI_ARBURST,
    output     [3:0]                        M_AXI_ARCACHE,
    output     [3:0]                        M_AXI_ARQOS,
    input                                                   M_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    input[DW-1:0]                                           M_AXI_RDATA,
    input                                                   M_AXI_RVALID,
    input[1:0]                                              M_AXI_RRESP,
    input                                                   M_AXI_RLAST,
    output                                  M_AXI_RREADY
    //==========================================================================
);

assign M_AXI_RREADY  = 1;
assign M_AXI_ARLEN   = 63;
assign M_AXI_ARSIZE  = $clog2(DW/8);
assign M_AXI_ARBURST = 1;
assign M_AXI_ARADDR  = first_address;

reg[2:0] fsm_state;

always @(posedge clk) begin

    if (resetn == 0) begin
        fsm_state <= 0;
    end else case (fsm_state)

        0:  if (start) begin
                M_AXI_ARVALID <= 1;
                fsm_state     <= 1;
            end

        1:  if (M_AXI_ARREADY & M_AXI_ARVALID) begin
                M_AXI_ARVALID <= 0;
                fsm_state     <= 0;
            end

    endcase
end


endmodule