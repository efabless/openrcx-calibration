#!/bin/sh


export CORNER=$1
export SCRIPTS_DIR=./scripts
export REF_EXTRATOR=magic
export TECH_LEF=./tech/sky130_fd_sc_hd.$CORNER.tlef
export EXT_DIR=./openrcx-$REF_EXTRATOR
export EXT_RULES=$EXT_DIR/rules/openrcx.$CORNER.rules.$REF_EXTRATOR
export REF_SPEF=./magic/blk-sky130A.spef

gunzip $REF_SPEF

mkdir -p $EXT_DIR/rules

export OPENLANE_TOOLS=/foss/tools/openlane_tools

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_patterns.tcl 

mv rulesGen.log $EXT_DIR

#$SCRIPT_DIR/make_spef_file.sh	 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_rules.tcl 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/extract_patterns.tcl 

mv ./diff_spef.out $EXT_DIR/diff-spef-openrcx-$REF_EXTRATOR.$CORNER.out
mv ./diff_spef.log $EXT_DIR/diff-spef-openrcx-$REF_EXTRATOR.$CORNER.log

gzip -9 ./magic-spef/*.spef

mv rulesGen.log $EXT_DIR



