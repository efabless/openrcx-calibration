#################################################
# Desc: This script is used to create the RC 
#       table used for OpenRCX parasitic 
#       calculation. It takes the patterns layout
#       parasitics from reference extractor (SPEF)
#       and convert it to Extraction
#       Rules file (RC Table).
#       
# Input:  - tech_Lef
#         - patterns.spef
#
# Output: - <extRules>.rules
#
##################################################

read_lef $env(TECH_LEF)

# Read the patterns design
read_def $env(EXT_DIR)/patterns.def

bench_read_spef $env(REF_SPEF)

# Convert the parasitics into 
write_rules -file $env(EXT_DIR)/$env(PDK)/rules.openrcx.$env(PDK).$env(CORNER).$env(REF_EXTRACTOR) -db

exit
