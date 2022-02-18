#!/bin/sh
python3 ./tools/spef_extractor/main.py \
         --def_file ./openrcx/patterns.def \
         --lef_file ./tech/sky130_fd_sc_hd.tlef \
         --wire_model pi \
         --edge_cap_factor 1
