module cmac_reset_mgr
(
    input   src_aresetn,

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 init_clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET init_reset" *)
    input   init_clk,


    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 stream_clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET stream_resetn" *)
    input   stream_clk,

    // Provides reset to the CMAC, synchronous to init_clk
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 init_reset RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
    output  init_reset,


    // A resetn that is synchronous to the RX and TX stream
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 stream_resetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    output  stream_resetn
);

    wire init_resetn;

    xpm_cdc_async_rst #
    (
        .DEST_SYNC_FF(4),    
        .INIT_SYNC_FF(0),    
        .RST_ACTIVE_HIGH(0)  
    )
    i_cmac
    (
        .src_arst   (src_aresetn),   
        .dest_clk   (init_clk   ),   
        .dest_arst  (init_resetn)
    );


    xpm_cdc_async_rst #
    (
        .DEST_SYNC_FF(4),    
        .INIT_SYNC_FF(0),    
        .RST_ACTIVE_HIGH(0)  
    )
    i_stream
    (
        .src_arst   (src_aresetn  ),   
        .dest_clk   (stream_clk   ),   
        .dest_arst  (stream_resetn)
    );


    assign init_reset = ~init_resetn;

endmodule