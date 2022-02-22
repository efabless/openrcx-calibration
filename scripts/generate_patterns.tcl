#################################################
# Desc: This script is used to generate patterns 
#       geometries that model various capacitance 
#       and resistance models
# Input: tech_Lef
# Output: patterns.def
#         patterns.v
#################################################


# Read Technology LEF
read_lef $env(TECH_LEF)

# Creates the patterns and store it in the database
 bench_wires -len 100  -cnt 5 -all

# Writes the verilog netlist of the patterns
bench_verilog $env(EXT_DIR)/patterns.v

write_def $env(EXT_DIR)/patterns.def

exit
