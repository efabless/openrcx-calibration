
read_lef $env(TECH_LEF)

read_def $env(EXT_DIR)/patterns.def

define_process_corner -ext_model_index 0 X

extract_parasitics -ext_model_file $env(EXT_RULES) -lef_res -cc_model 12 -max_res 0 -context_depth 10 -coupling_threshold 0 

write_spef $env(EXT_DIR)/patterns.openrcx.$env(CORNER).spef

diff_spef -file $env(REF_SPEF)


exit
