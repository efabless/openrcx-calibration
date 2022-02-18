source ./scripts/user_env.tcl

set golden_spef $ext_dir/patterns.spef

read_lef $TECH_LEF

read_def $ext_dir/patterns.def

define_process_corner -ext_model_index 0 X

extract_parasitics -ext_model_file $extRules -cc_model 12 -max_res 0 -context_depth 10 -coupling_threshold 0.1

write_spef $ext_dir/patterns-openrcx.spef

diff_spef -file $golden_spef

exit
