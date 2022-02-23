#!/bin/sh

export PDK=$1
export CORNER=$2
export SCRIPTS_DIR=./scripts
export REF_EXTRATOR=magic
export TECH_LEF=./tech/$PDK/sky130_fd_sc_hd.$CORNER.tlef
export EXT_DIR=./openrcx-$REF_EXTRATOR
export REF_SPEF=./magic/blk-sky130A.nom.spef
export EXT_RULES=$EXT_DIR/rules/$PDK/rules.$PDK.$CORNER.openrcx.$REF_EXTRATOR

mkdir -p $EXT_DIR/rules/$PDK

gunzip $REF_SPEF.gz

mkdir -p $EXT_DIR/rules

export OPENLANE_TOOLS=/foss/tools/openlane_tools

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_patterns.tcl 

mv rulesGen.log $EXT_DIR

#$SCRIPT_DIR/make_spef_file.sh	 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_rules.tcl 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/extract_patterns.tcl 

mv ./diff_spef.out $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.out
mv ./diff_spef.log $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.log

gzip -9 ./magic-spef/*.spef

mv rulesGen.log $EXT_DIR



