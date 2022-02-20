#!/bin/sh

/foss/tools/openlane_tools/2022.02.08_01.48.52/bin/openroad ./scripts/generate_patterns.tcl 

mv rulesGen.log ./openrcx

python3 ./tools/spef_extractor/main.py \
         --def_file ./openrcx/patterns.def \
         --lef_file ./tech/sky130_fd_sc_hd.tlef \
         --wire_model L \
         --edge_cap_factor 1

/foss/tools/openlane_tools/2022.02.08_01.48.52/bin/openroad ./scripts/generate_rules.tcl 

/foss/tools/openlane_tools/2022.02.08_01.48.52/bin/openroad ./scripts/extract_patterns.tcl 

mv diff_* ./openrcx
rm -f rulesGen.log

