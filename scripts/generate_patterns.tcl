#################################################
# Desc: This script is used to generate patterns 
#       geometries that model various capacitance 
#       and resistance models
# Input: tech_Lef
# Output: patterns.def
#         patterns.v
#################################################

source ./scripts/user_env.tcl


# Read Technology LEF
read_lef $TECH_LEF

# Creates the patterns and store it in the database
 bench_wires -len 10  -cnt 5 -all
#bench_wires -len 100 -cnt 5 -all

# Writes the verilog netlist of the patterns
bench_verilog $ext_dir/patterns.v

write_def $ext_dir/patterns.def

exit
