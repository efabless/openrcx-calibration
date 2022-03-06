#!/bin/sh

export PDK=$1
export CORNER=$2
export PDK_ROOT=${PDK_ROOT:=/foss/pdk}
export SCRIPTS_DIR=$(pwd)/scripts
export REF_EXTRACTOR=magic
export TECH_LEF=$PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__$CORNER.tlef
#export TECH_LEF=$(pwd)/tech/$PDK/sky130_fd_sc_hd__$CORNER.tlef
export EXT_DIR=$(pwd)/openrcx-$REF_EXTRACTOR
export REF_SPEF=$EXT_DIR/blk.$PDK.$CORNER.spef
export EXT_RULES=$EXT_DIR/$PDK/rules.openrcx.$PDK.$CORNER.$REF_EXTRACTOR
export OPENLANE_TOOLS=/foss/tools/openlane_tools

echo $REF_EXTRACTOR
echo $CORNER
echo $EXT_DIR

mkdir -p $EXT_DIR/$PDK

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_patterns.tcl 

\mv rulesGen.log $EXT_DIR

$SCRIPTS_DIR/make_spef_file.sh $EXT_DIR/patterns.def $CORNER

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/generate_rules.tcl 

$OPENLANE_TOOLS/bin/openroad $SCRIPTS_DIR/extract_patterns.tcl 

\mv ./diff_spef.out $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.out
\mv ./diff_spef.log $EXT_DIR/diff-spef.openrcx.$PDK.$CORNER.$REF_EXTRATOR.log

\rm rulesGen.log 



