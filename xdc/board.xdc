
# ---------------------------------------------------------------------------
# Pin definitions
# ---------------------------------------------------------------------------


#===============================================================================
#                            Clocks & system signals
#===============================================================================

#
# 200 Mhz clock
#
#set_property -dict {PACKAGE_PIN G17  IOSTANDARD LVDS  DIFF_TERM_ADV TERM_100  EQUALIZATION EQ_LEVEL0} [ get_ports clk_200mhz_clk_p ]
#set_property -dict {PACKAGE_PIN G16  IOSTANDARD LVDS  DIFF_TERM_ADV TERM_100  EQUALIZATION EQ_LEVEL0} [ get_ports clk_200mhz_clk_n ]
#create_clock -period 5.000 -name sysclk200                                                            [ get_ports clk_200mhz_clk_p ]
#set_clock_groups -name group_sysclk200 -asynchronous -group [get_clocks sysclk200]



#
# PCIe endpoint refclk
#
set_property -dict {PACKAGE_PIN U29}          [get_ports pcie_refclk_clk_p]
set_property -dict {PACKAGE_PIN U30}          [get_ports pcie_refclk_clk_n]  
create_clock -period 10.000 -name pcie_sysclk [get_ports pcie_refclk_clk_p]
set_clock_groups -name group_pcie_sysclk -asynchronous -group [get_clocks pcie_sysclk]


#
# LEDs
#
#set_property -dict {PACKAGE_PIN AW26  IOSTANDARD LVCMOS18} [ get_ports LED[0] ]
#set_property -dict {PACKAGE_PIN AW23  IOSTANDARD LVCMOS18} [ get_ports LED[1] ]
#set_property -dict {PACKAGE_PIN AW25  IOSTANDARD LVCMOS18} [ get_ports LED[2] ]
#set_property -dict {PACKAGE_PIN AU23  IOSTANDARD LVCMOS18} [ get_ports LED[3] ]
#set_property -dict {PACKAGE_PIN AU25  IOSTANDARD LVCMOS18} [ get_ports LED[4] ]
#set_property -dict {PACKAGE_PIN AV23  IOSTANDARD LVCMOS18} [ get_ports LED[5] ]
#set_property -dict {PACKAGE_PIN AW24  IOSTANDARD LVCMOS18} [ get_ports LED[6] ]
#set_property -dict {PACKAGE_PIN AV25  IOSTANDARD LVCMOS18} [ get_ports LED[7] ]

set_property -dict {PACKAGE_PIN AW24  IOSTANDARD LVCMOS18} [ get_ports qsfp1_up ]
set_property -dict {PACKAGE_PIN AV25  IOSTANDARD LVCMOS18} [ get_ports qsfp0_up ]




#
# Clock inputs for QSFP 0
#
set_property PACKAGE_PIN AE29 [get_ports qsfp0_clk_clk_p]
set_property PACKAGE_PIN AE30 [get_ports qsfp0_clk_clk_n]


#
# Clock inputs for QSFP 1
#
set_property PACKAGE_PIN AB27 [get_ports qsfp1_clk_clk_p]
set_property PACKAGE_PIN AB28 [get_ports qsfp1_clk_clk_n]


#
# QSFP-related I2C bus
#
#set_property -dict {PACKAGE_PIN AT10  IOSTANDARD LVCMOS18}  [get_ports I2C_MUX_ENABLE ]
#set_property -dict {PACKAGE_PIN AW21  IOSTANDARD LVCMOS18}  [get_ports QSFP_IIC_scl_io]
#set_property -dict {PACKAGE_PIN AW20  IOSTANDARD LVCMOS18}  [get_ports QSFP_IIC_sda_io]

#
# Temp sensor I2C bus
#
#set_property -dict {PACKAGE_PIN AK28  IOSTANDARD LVCMOS18}  [get_ports QSFP_IIC_scl_io]
#set_property -dict {PACKAGE_PIN AJ26  IOSTANDARD LVCMOS18}  [get_ports QSFP_IIC_sda_io]


