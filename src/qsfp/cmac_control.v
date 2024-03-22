//===================================================================================================
//                            ------->  Revision History  <------
//===================================================================================================
//
//   Date     Who   Ver  Changes
//===================================================================================================
// 29-Feb-23  DWW  1000  Initial creation
//===================================================================================================

module cmac_control # (parameter RSFEC = 1)
(
    (* X_INTERFACE_INFO = "xilinx.com:*:rs_fec_ports:2.0 rs_fec ctl_rx_rsfec_enable" *)
    output ctl_rx_rsfec_enable,
    
    (* X_INTERFACE_INFO = "xilinx.com:*:rs_fec_ports:2.0 rs_fec ctl_rx_rsfec_enable_correction" *)
    output ctl_rx_rsfec_enable_correction,

    (* X_INTERFACE_INFO = "xilinx.com:*:rs_fec_ports:2.0 rs_fec ctl_rx_rsfec_enable_indication" *)
    output ctl_rx_rsfec_enable_indication,

    (* X_INTERFACE_INFO = "xilinx.com:*:rs_fec_ports:2.0 rs_fec ctl_tx_rsfec_enable" *)
    output ctl_tx_rsfec_enable,

    (* X_INTERFACE_INFO = "xilinx.com:*:ctrl_ports:2.0 ctl_tx ctl_enable" *)
    output ctl_tx_enable, 

    (* X_INTERFACE_INFO = "xilinx.com:*:ctrl_ports:2.0 ctl_tx ctl_tx_send_rfi" *)
    output ctl_tx_send_rfi,

    (* X_INTERFACE_INFO = "xilinx.com:*:ctrl_ports:2.0 ctl_rx ctl_enable" *)
    output ctl_rx_enable,

    // This comes from the stat_rx interface of the CMAC
    input      stat_rx_aligned
);


//=============================================================================
// The tx_enable and "send remote fault indicator" depend on whether or not
// PCS alignment has been acheived
//=============================================================================
assign ctl_rx_enable   = 1;
assign ctl_tx_enable   = stat_rx_aligned;
assign ctl_tx_send_rfi = ~stat_rx_aligned;
//=============================================================================


//=============================================================================
// Enable or disable forward error correction
//=============================================================================
assign ctl_rx_rsfec_enable            = RSFEC;
assign ctl_rx_rsfec_enable_correction = RSFEC;
assign ctl_rx_rsfec_enable_indication = RSFEC;
assign ctl_tx_rsfec_enable            = RSFEC;
//=============================================================================


endmodule