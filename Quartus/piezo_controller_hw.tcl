###############################################################################
# piezo_controller_hw.tcl
# =======================
#
# Author       : Léa Strobino
# Revision     : 1.1
# Last updated : Tue, 13 Nov 2018 20:40:08 +0100
###############################################################################


# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module piezo_controller
# 
set_module_property DESCRIPTION ""
set_module_property NAME piezo_controller
set_module_property VERSION 1.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Léa Strobino"
set_module_property DISPLAY_NAME "Piezo Controller"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property VALIDATION_CALLBACK validate

proc validate {} {
set_module_assignment embeddedsw.CMacro.FREQ [get_parameter_value CLOCK_RATE]
set_module_assignment embeddedsw.CMacro.PIEZO_COUNT [get_parameter_value g_PIEZO_COUNT]
}


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL piezo_controller
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file piezo_controller.vhd VHDL PATH ../VHDL/piezo_controller.vhd TOP_LEVEL_FILE
add_fileset_file piezo.vhd VHDL PATH ../VHDL/piezo.vhd


# 
# parameters
# 
add_parameter CLOCK_RATE INTEGER 0
set_parameter_property CLOCK_RATE DEFAULT_VALUE 0
set_parameter_property CLOCK_RATE DISPLAY_NAME "Clock frequency"
set_parameter_property CLOCK_RATE TYPE INTEGER
set_parameter_property CLOCK_RATE UNITS None
set_parameter_property CLOCK_RATE SYSTEM_INFO_TYPE CLOCK_RATE
set_parameter_property CLOCK_RATE SYSTEM_INFO_ARG clk
add_parameter g_PIEZO_COUNT INTEGER 120
set_parameter_property g_PIEZO_COUNT DEFAULT_VALUE 120
set_parameter_property g_PIEZO_COUNT DISPLAY_NAME "Piezo count"
set_parameter_property g_PIEZO_COUNT TYPE INTEGER
set_parameter_property g_PIEZO_COUNT UNITS None
set_parameter_property g_PIEZO_COUNT ALLOWED_RANGES 1:120
set_parameter_property g_PIEZO_COUNT HDL_PARAMETER true


# 
# module assignments
# 
set_module_assignment embeddedsw.CMacro.ENABLE_REG_OFST 0x0
set_module_assignment embeddedsw.CMacro.PERIOD_REG_OFST 0x2
set_module_assignment embeddedsw.CMacro.PHASE_A_COUNT_REG_OFST 0x4
set_module_assignment embeddedsw.CMacro.PHASE_B_COUNT_REG_OFST 0x6
set_module_assignment embeddedsw.CMacro.PHASE_A_REG_OFST 0x20
set_module_assignment embeddedsw.CMacro.PHASE_B_REG_OFST 0x110


# 
# connection point clk
# 
add_interface clk clock end
set_interface_property clk clockRate 0
set_interface_property clk ENABLED true
set_interface_property clk EXPORT_OF ""
set_interface_property clk PORT_NAME_MAP ""
set_interface_property clk CMSIS_SVD_VARIABLES ""
set_interface_property clk SVD_ADDRESS_GROUP ""

add_interface_port clk clk_i clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n_i reset_n Input 1


# 
# connection point s1
# 
add_interface s1 avalon end
set_interface_property s1 addressUnits WORDS
set_interface_property s1 associatedClock clk
set_interface_property s1 associatedReset reset
set_interface_property s1 bitsPerSymbol 8
set_interface_property s1 burstOnBurstBoundariesOnly false
set_interface_property s1 burstcountUnits WORDS
set_interface_property s1 explicitAddressSpan 0
set_interface_property s1 holdTime 0
set_interface_property s1 linewrapBursts false
set_interface_property s1 maximumPendingReadTransactions 0
set_interface_property s1 maximumPendingWriteTransactions 0
set_interface_property s1 readLatency 0
set_interface_property s1 readWaitTime 1
set_interface_property s1 setupTime 0
set_interface_property s1 timingUnits Cycles
set_interface_property s1 writeWaitTime 0
set_interface_property s1 ENABLED true
set_interface_property s1 EXPORT_OF ""
set_interface_property s1 PORT_NAME_MAP ""
set_interface_property s1 CMSIS_SVD_VARIABLES ""
set_interface_property s1 SVD_ADDRESS_GROUP ""

add_interface_port s1 AVS_Address_i address Input 8
add_interface_port s1 AVS_Read_i read Input 1
add_interface_port s1 AVS_ReadData_o readdata Output 16
add_interface_port s1 AVS_Write_i write Input 1
add_interface_port s1 AVS_WriteData_i writedata Input 16
set_interface_assignment s1 embeddedsw.configuration.isFlash 0
set_interface_assignment s1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point enable
# 
add_interface enable conduit end
set_interface_property enable associatedClock clk
set_interface_property enable associatedReset reset
set_interface_property enable ENABLED true
set_interface_property enable EXPORT_OF ""
set_interface_property enable PORT_NAME_MAP ""
set_interface_property enable CMSIS_SVD_VARIABLES ""
set_interface_property enable SVD_ADDRESS_GROUP ""

add_interface_port enable enable_o export Output 1


# 
# connection point status
# 
add_interface status conduit end
set_interface_property status associatedClock clk
set_interface_property status associatedReset reset
set_interface_property status ENABLED true
set_interface_property status EXPORT_OF ""
set_interface_property status PORT_NAME_MAP ""
set_interface_property status CMSIS_SVD_VARIABLES ""
set_interface_property status SVD_ADDRESS_GROUP ""

add_interface_port status status_o export Output 3


# 
# connection point wave
# 
add_interface wave conduit end
set_interface_property wave associatedClock clk
set_interface_property wave associatedReset reset
set_interface_property wave ENABLED true
set_interface_property wave EXPORT_OF ""
set_interface_property wave PORT_NAME_MAP ""
set_interface_property wave CMSIS_SVD_VARIABLES ""
set_interface_property wave SVD_ADDRESS_GROUP ""

add_interface_port wave wave_o export Output g_PIEZO_COUNT
