#!/bin/sh


export REF_EXTRATOR=magic
export EXT_DIR=./openrcx-$REF_EXTRATOR

\rm -rf $EXT_DIR/diff* $EXT_DIR/pattern* $EXT_DIR/*.spef $EXT_DIR/*.ext $EXT_DIR/*.log *.log $EXT_DIR/sky130*/*.log

export REF_EXTRATOR=spef_extractor
export EXT_DIR=./openrcx-$REF_EXTRATOR

\rm -rf $EXT_DIR/diff* $EXT_DIR/pattern* $EXT_DIR/*.spef $EXT_DIR/*.ext $EXT_DIR/*.log *.log $EXT_DIR/sky130*/*.log
