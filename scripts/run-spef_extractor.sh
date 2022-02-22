#!/bin/sh


export CORNER=$1
export SCRIPTS_DIR=./scripts
export REF_EXTRATOR=spef_extractor
export TECH_LEF=./tech/sky130_fd_sc_hd.$CORNER.tlef
export EXT_DIR=./openrcx-$REF_EXTRATOR
export REF_SPEF=$EXT_DIR/patterns.$REF_EXTRATOR.$CORNER.spef
export EXT_RULES=$EXT_DIR/rules/openrcx.$CORNER.rules.$REF_EXTRATOR

mkdir -p $EXT_DIR/rules

#export OPENLANE_TOOLS=/foss/tools/openlane_tools/2022.02.08_01.48.52
export OPENLANE_TOOLS=/foss/tools/openlane_tools

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_patterns.tcl 

mv rulesGen.log $EXT_DIR

python3 ./tools/$REF_EXTRATOR/main.py --def_file $EXT_DIR/patterns.def --lef_file $TECH_LEF --wire_model L --edge_cap_factor 1
#$SCRIPT_DIR/make_spef_file.sh
	 
mv $EXT_DIR/patterns.spef $REF_SPEF

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_rules.tcl 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/extract_patterns.tcl 

mv ./diff_spef.out $EXT_DIR/diff-spef-openrcx-$REF_EXTRATOR.$CORNER.out
mv ./diff_spef.log $EXT_DIR/diff-spef-openrcx-$REF_EXTRATOR.$CORNER.log

