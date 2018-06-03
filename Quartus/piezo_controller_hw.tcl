###############################################################################
# piezo_controller_hw.tcl
# =======================
#
# Author       : Léa Strobino
# Revision     : 1.0
# Last updated : Wed, 18 Apr 2018 17:47:44 +0200
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
set_module_property VERSION 1.0
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
set_module_assignment embeddedsw.CMacro.FREQ [get_parameter_value clock_rate]
set_module_assignment embeddedsw.CMacro.PIEZO_COUNT [get_parameter_value piezo_count]
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
add_parameter clock_rate INTEGER
set_parameter_property clock_rate DISPLAY_NAME "Clock frequency"
set_parameter_property clock_rate SYSTEM_INFO_TYPE CLOCK_RATE
set_parameter_property clock_rate SYSTEM_INFO_ARG clk
add_parameter piezo_count INTEGER 120
set_parameter_property piezo_count DEFAULT_VALUE 120
set_parameter_property piezo_count DISPLAY_NAME "Piezo count"
set_parameter_property piezo_count TYPE INTEGER
set_parameter_property piezo_count UNITS None
set_parameter_property piezo_count ALLOWED_RANGES 1:120
set_parameter_property piezo_count HDL_PARAMETER true


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

add_interface_port clk clk clk Input 1


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

add_interface_port reset reset_n reset_n Input 1


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

add_interface_port s1 AVS_Address address Input 8
add_interface_port s1 AVS_Read read Input 1
add_interface_port s1 AVS_ReadData readdata Output 16
add_interface_port s1 AVS_Write write Input 1
add_interface_port s1 AVS_WriteData writedata Input 16
set_interface_assignment s1 embeddedsw.configuration.isFlash 0
set_interface_assignment s1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point piezo_out
# 
add_interface piezo_out conduit end
set_interface_property piezo_out associatedClock clk
set_interface_property piezo_out associatedReset reset
set_interface_property piezo_out ENABLED true
set_interface_property piezo_out EXPORT_OF ""
set_interface_property piezo_out PORT_NAME_MAP ""
set_interface_property piezo_out CMSIS_SVD_VARIABLES ""
set_interface_property piezo_out SVD_ADDRESS_GROUP ""

add_interface_port piezo_out piezo_out export Output piezo_count


# 
# connection point piezo_enable
# 
add_interface piezo_enable conduit end
set_interface_property piezo_enable associatedClock clk
set_interface_property piezo_enable associatedReset reset
set_interface_property piezo_enable ENABLED true
set_interface_property piezo_enable EXPORT_OF ""
set_interface_property piezo_enable PORT_NAME_MAP ""
set_interface_property piezo_enable CMSIS_SVD_VARIABLES ""
set_interface_property piezo_enable SVD_ADDRESS_GROUP ""

add_interface_port piezo_enable piezo_enable export Output 1


# 
# connection point piezo_status
# 
add_interface piezo_status conduit end
set_interface_property piezo_status associatedClock clk
set_interface_property piezo_status associatedReset reset
set_interface_property piezo_status ENABLED true
set_interface_property piezo_status EXPORT_OF ""
set_interface_property piezo_status PORT_NAME_MAP ""
set_interface_property piezo_status CMSIS_SVD_VARIABLES ""
set_interface_property piezo_status SVD_ADDRESS_GROUP ""

add_interface_port piezo_status piezo_status export Output 3
