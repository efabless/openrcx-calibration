############################
# DATA GENERATION SETTINGS 
############################

# Variables that point to the LEF files
# NEEDS to be changed for different tech.
#set TECH_LEF  ./tech/sky130_fd_sc_hd.tlef

set ext_dir ./openrcx
exec mkdir -p $ext_dir/rules

# This is just an example of the parasitics of the 
# patterns that is used for Demo purposes.
# NEEDS to be changed for different tech.

set golden_spef $ext_dir/patterns.spef_extractor.$env(CORNER).spef
#set golden_spef ./magic/blk.spef

# Technology Node 
set PROCESS_NODE 130

#
# The file name and location of the custom RC tech file
# The name is subject to change
set extRules $ext_dir/rules/openrcx.$env(CORNER).rules

