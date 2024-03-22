# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RAM_TYPE" -parent ${Page_0}


}

proc update_PARAM_VALUE.DD { PARAM_VALUE.DD } {
	# Procedure called to update DD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DD { PARAM_VALUE.DD } {
	# Procedure called to validate DD
	return true
}

proc update_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to update DW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to validate DW
	return true
}

proc update_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to update RAM_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to validate RAM_TYPE
	return true
}


proc update_MODELPARAM_VALUE.DW { MODELPARAM_VALUE.DW PARAM_VALUE.DW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DW}] ${MODELPARAM_VALUE.DW}
}

proc update_MODELPARAM_VALUE.DD { MODELPARAM_VALUE.DD PARAM_VALUE.DD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DD}] ${MODELPARAM_VALUE.DD}
}

proc update_MODELPARAM_VALUE.RAM_TYPE { MODELPARAM_VALUE.RAM_TYPE PARAM_VALUE.RAM_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RAM_TYPE}] ${MODELPARAM_VALUE.RAM_TYPE}
}

