#!/bin/sh

export PDK=$1
export CORNER=$2
export PDK_ROOT=/foss/pdks
export SCRIPTS_DIR=$(pwd)/scripts
export REF_EXTRACTOR=magic
export TECH_LEF=$PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__$CORNER.tlef
export EXT_DIR=$(pwd)/openrcx-$REF_EXTRACTOR
export REF_SPEF=$EXT_DIR/blk.$PDK.$CORNER.spef
export EXT_RULES=$EXT_DIR/$PDK/rules.openrcx.$PDK.$CORNER.$REF_EXTRACTOR
export XTOOLS=/foss/tools/openlane_tools/2022.05.30_01.41.33


echo $REF_EXTRACTOR
echo $CORNER
echo $EXT_DIR

mkdir -p $EXT_DIR/$PDK

$XTOOLS/bin/openroad $SCRIPTS_DIR/generate_patterns.tcl 

\mv rulesGen.log $EXT_DIR

$SCRIPTS_DIR/make_spef_file.sh $EXT_DIR/patterns.def $CORNER

$XTOOLS/bin/openroad  $SCRIPTS_DIR/generate_rules.tcl 

$XTOOLS/bin/openroad  $SCRIPTS_DIR/extract_patterns.tcl 

\mv ./diff_spef.out $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.out
\mv ./diff_spef.log $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.log

\rm rulesGen.log 



