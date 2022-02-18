############################
# DATA GENERATION SETTINGS 
############################

# Variables that point to the LEF files
# NEEDS to be changed for different tech.
set TECH_LEF /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
set MACRO_LEF /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# This is just an example of the parasitics of the 
# patterns that is used for Demo purposes.
# NEEDS to be changed for different tech.
set golden_spef ./EXT/patterns.spef

# Technology Node 
set PROCESS_NODE 130

# Process corner
# NEEDS to be changed for different corners.
set CORNER RCmax

# The file name and location of the custom RC tech file
# The name is subject to change
set extRules ./${CORNER}.rules

