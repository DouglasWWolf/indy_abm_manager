module fill_ram #
(

    parameter DW = 512,
    parameter AW = 16,
    parameter FIRST_DATA = 32'hC000_0000

)
(
    input   clk, resetn,

    input   start,

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
    output[AW-1:0]                          M_AXI_ARADDR,
    output                                  M_AXI_ARVALID,
    output[2:0]                             M_AXI_ARPROT,
    output                                  M_AXI_ARLOCK,
    output[3:0]                             M_AXI_ARID,
    output[7:0]                             M_AXI_ARLEN,
    output[1:0]                             M_AXI_ARBURST,
    output[3:0]                             M_AXI_ARCACHE,
    output[3:0]                             M_AXI_ARQOS,
    input                                                   M_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    input[DW-1:0]                                           M_AXI_RDATA,
    input                                                   M_AXI_RVALID,
    input[1:0]                                              M_AXI_RRESP,
    input                                                   M_AXI_RLAST,
    output                                  M_AXI_RREADY
    //==========================================================================
);

localparam RAM_SIZE = 64 * 1024;
localparam BLOCK_SIZE = 4096;
localparam CYCLES_PER_BLOCK = BLOCK_SIZE / (DW/8);
localparam MAX_BLOCKS = RAM_SIZE / BLOCK_SIZE;

reg[2:0] awsm_state, wsm_state;


assign M_AXI_AWSIZE  = $clog2(DW/8);
assign M_AXI_AWLEN   = CYCLES_PER_BLOCK - 1;
assign M_AXI_AWBURST = 1;

reg[31:0] awsm_block_count;
always @(posedge clk) begin
    if (resetn == 0) begin
        awsm_state    <= 0;
        M_AXI_AWVALID <= 0;
    end else case (awsm_state)

        0:  if (start) begin
                M_AXI_AWADDR     <= 0;
                M_AXI_AWVALID    <= 1;
                awsm_block_count <= 1;
                awsm_state       <= 1;
            end

        1:  if (M_AXI_AWREADY & M_AXI_AWVALID) begin
                if (awsm_block_count == MAX_BLOCKS) begin
                    M_AXI_AWVALID    <= 0;
                    awsm_state       <= 0;
                end else begin
                    awsm_block_count <= awsm_block_count + 1;
                    M_AXI_AWADDR     <= M_AXI_AWADDR + BLOCK_SIZE;
                end
            end

    endcase

end


reg[31:0] data_counter;
reg[31:0] wsm_block_count;
reg[7:0]  beat;

assign M_AXI_WLAST = (beat == CYCLES_PER_BLOCK - 1) && M_AXI_WVALID & M_AXI_WREADY;

always @(posedge clk) begin
    
    if (resetn == 0) begin
        wsm_state    <= 0;
        M_AXI_WVALID <= 0;
    end else case (wsm_state)

        0:  if (start) begin
                beat            <= 0;
                M_AXI_WDATA     <= FIRST_DATA;
                M_AXI_WVALID    <= 1;
                wsm_block_count <= 1;
                wsm_state       <= 1;
            end


        1:  if (M_AXI_WREADY & M_AXI_WVALID) begin
                M_AXI_WDATA <= M_AXI_WDATA + 1;
                beat        <= beat + 1;
                if (M_AXI_WLAST) begin
                    if (wsm_block_count == MAX_BLOCKS) begin
                        M_AXI_WVALID <= 0;
                        wsm_state    <= 0;
                    end else begin
                        beat            <= 0;
                        wsm_block_count <= wsm_block_count + 1;
                    end
                end
            end

    endcase

end











assign M_AXI_BREADY = 1;

endmodule