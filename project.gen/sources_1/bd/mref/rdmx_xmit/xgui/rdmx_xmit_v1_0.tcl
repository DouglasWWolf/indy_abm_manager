# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_WBITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_FIFO_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WBITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DST_IP0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DST_IP1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DST_IP2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DST_IP3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_CLOCK_MODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_PACKET_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REMOTE_SERVER_PORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SOURCE_PORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SRC_IP0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SRC_IP1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SRC_IP2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SRC_IP3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SRC_MAC" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_WBITS { PARAM_VALUE.ADDR_WBITS } {
	# Procedure called to update ADDR_WBITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_WBITS { PARAM_VALUE.ADDR_WBITS } {
	# Procedure called to validate ADDR_WBITS
	return true
}

proc update_PARAM_VALUE.DATA_FIFO_DEPTH { PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to update DATA_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_FIFO_DEPTH { PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to validate DATA_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.DATA_WBITS { PARAM_VALUE.DATA_WBITS } {
	# Procedure called to update DATA_WBITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WBITS { PARAM_VALUE.DATA_WBITS } {
	# Procedure called to validate DATA_WBITS
	return true
}

proc update_PARAM_VALUE.DST_IP0 { PARAM_VALUE.DST_IP0 } {
	# Procedure called to update DST_IP0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DST_IP0 { PARAM_VALUE.DST_IP0 } {
	# Procedure called to validate DST_IP0
	return true
}

proc update_PARAM_VALUE.DST_IP1 { PARAM_VALUE.DST_IP1 } {
	# Procedure called to update DST_IP1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DST_IP1 { PARAM_VALUE.DST_IP1 } {
	# Procedure called to validate DST_IP1
	return true
}

proc update_PARAM_VALUE.DST_IP2 { PARAM_VALUE.DST_IP2 } {
	# Procedure called to update DST_IP2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DST_IP2 { PARAM_VALUE.DST_IP2 } {
	# Procedure called to validate DST_IP2
	return true
}

proc update_PARAM_VALUE.DST_IP3 { PARAM_VALUE.DST_IP3 } {
	# Procedure called to update DST_IP3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DST_IP3 { PARAM_VALUE.DST_IP3 } {
	# Procedure called to validate DST_IP3
	return true
}

proc update_PARAM_VALUE.FIFO_CLOCK_MODE { PARAM_VALUE.FIFO_CLOCK_MODE } {
	# Procedure called to update FIFO_CLOCK_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_CLOCK_MODE { PARAM_VALUE.FIFO_CLOCK_MODE } {
	# Procedure called to validate FIFO_CLOCK_MODE
	return true
}

proc update_PARAM_VALUE.MAX_PACKET_COUNT { PARAM_VALUE.MAX_PACKET_COUNT } {
	# Procedure called to update MAX_PACKET_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_PACKET_COUNT { PARAM_VALUE.MAX_PACKET_COUNT } {
	# Procedure called to validate MAX_PACKET_COUNT
	return true
}

proc update_PARAM_VALUE.REMOTE_SERVER_PORT { PARAM_VALUE.REMOTE_SERVER_PORT } {
	# Procedure called to update REMOTE_SERVER_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REMOTE_SERVER_PORT { PARAM_VALUE.REMOTE_SERVER_PORT } {
	# Procedure called to validate REMOTE_SERVER_PORT
	return true
}

proc update_PARAM_VALUE.SOURCE_PORT { PARAM_VALUE.SOURCE_PORT } {
	# Procedure called to update SOURCE_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SOURCE_PORT { PARAM_VALUE.SOURCE_PORT } {
	# Procedure called to validate SOURCE_PORT
	return true
}

proc update_PARAM_VALUE.SRC_IP0 { PARAM_VALUE.SRC_IP0 } {
	# Procedure called to update SRC_IP0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IP0 { PARAM_VALUE.SRC_IP0 } {
	# Procedure called to validate SRC_IP0
	return true
}

proc update_PARAM_VALUE.SRC_IP1 { PARAM_VALUE.SRC_IP1 } {
	# Procedure called to update SRC_IP1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IP1 { PARAM_VALUE.SRC_IP1 } {
	# Procedure called to validate SRC_IP1
	return true
}

proc update_PARAM_VALUE.SRC_IP2 { PARAM_VALUE.SRC_IP2 } {
	# Procedure called to update SRC_IP2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IP2 { PARAM_VALUE.SRC_IP2 } {
	# Procedure called to validate SRC_IP2
	return true
}

proc update_PARAM_VALUE.SRC_IP3 { PARAM_VALUE.SRC_IP3 } {
	# Procedure called to update SRC_IP3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IP3 { PARAM_VALUE.SRC_IP3 } {
	# Procedure called to validate SRC_IP3
	return true
}

proc update_PARAM_VALUE.SRC_MAC { PARAM_VALUE.SRC_MAC } {
	# Procedure called to update SRC_MAC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_MAC { PARAM_VALUE.SRC_MAC } {
	# Procedure called to validate SRC_MAC
	return true
}


proc update_MODELPARAM_VALUE.DATA_WBITS { MODELPARAM_VALUE.DATA_WBITS PARAM_VALUE.DATA_WBITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WBITS}] ${MODELPARAM_VALUE.DATA_WBITS}
}

proc update_MODELPARAM_VALUE.ADDR_WBITS { MODELPARAM_VALUE.ADDR_WBITS PARAM_VALUE.ADDR_WBITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_WBITS}] ${MODELPARAM_VALUE.ADDR_WBITS}
}

proc update_MODELPARAM_VALUE.FIFO_CLOCK_MODE { MODELPARAM_VALUE.FIFO_CLOCK_MODE PARAM_VALUE.FIFO_CLOCK_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_CLOCK_MODE}] ${MODELPARAM_VALUE.FIFO_CLOCK_MODE}
}

proc update_MODELPARAM_VALUE.SRC_MAC { MODELPARAM_VALUE.SRC_MAC PARAM_VALUE.SRC_MAC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_MAC}] ${MODELPARAM_VALUE.SRC_MAC}
}

proc update_MODELPARAM_VALUE.SRC_IP0 { MODELPARAM_VALUE.SRC_IP0 PARAM_VALUE.SRC_IP0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IP0}] ${MODELPARAM_VALUE.SRC_IP0}
}

proc update_MODELPARAM_VALUE.SRC_IP1 { MODELPARAM_VALUE.SRC_IP1 PARAM_VALUE.SRC_IP1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IP1}] ${MODELPARAM_VALUE.SRC_IP1}
}

proc update_MODELPARAM_VALUE.SRC_IP2 { MODELPARAM_VALUE.SRC_IP2 PARAM_VALUE.SRC_IP2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IP2}] ${MODELPARAM_VALUE.SRC_IP2}
}

proc update_MODELPARAM_VALUE.SRC_IP3 { MODELPARAM_VALUE.SRC_IP3 PARAM_VALUE.SRC_IP3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IP3}] ${MODELPARAM_VALUE.SRC_IP3}
}

proc update_MODELPARAM_VALUE.DST_IP0 { MODELPARAM_VALUE.DST_IP0 PARAM_VALUE.DST_IP0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DST_IP0}] ${MODELPARAM_VALUE.DST_IP0}
}

proc update_MODELPARAM_VALUE.DST_IP1 { MODELPARAM_VALUE.DST_IP1 PARAM_VALUE.DST_IP1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DST_IP1}] ${MODELPARAM_VALUE.DST_IP1}
}

proc update_MODELPARAM_VALUE.DST_IP2 { MODELPARAM_VALUE.DST_IP2 PARAM_VALUE.DST_IP2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DST_IP2}] ${MODELPARAM_VALUE.DST_IP2}
}

proc update_MODELPARAM_VALUE.DST_IP3 { MODELPARAM_VALUE.DST_IP3 PARAM_VALUE.DST_IP3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DST_IP3}] ${MODELPARAM_VALUE.DST_IP3}
}

proc update_MODELPARAM_VALUE.SOURCE_PORT { MODELPARAM_VALUE.SOURCE_PORT PARAM_VALUE.SOURCE_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SOURCE_PORT}] ${MODELPARAM_VALUE.SOURCE_PORT}
}

proc update_MODELPARAM_VALUE.REMOTE_SERVER_PORT { MODELPARAM_VALUE.REMOTE_SERVER_PORT PARAM_VALUE.REMOTE_SERVER_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REMOTE_SERVER_PORT}] ${MODELPARAM_VALUE.REMOTE_SERVER_PORT}
}

proc update_MODELPARAM_VALUE.MAX_PACKET_COUNT { MODELPARAM_VALUE.MAX_PACKET_COUNT PARAM_VALUE.MAX_PACKET_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_PACKET_COUNT}] ${MODELPARAM_VALUE.MAX_PACKET_COUNT}
}

proc update_MODELPARAM_VALUE.DATA_FIFO_DEPTH { MODELPARAM_VALUE.DATA_FIFO_DEPTH PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_FIFO_DEPTH}] ${MODELPARAM_VALUE.DATA_FIFO_DEPTH}
}

