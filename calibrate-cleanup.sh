#!/bin/sh


export REF_EXTRATOR=magic
export EXT_DIR=./openrcx-$REF_EXTRATOR

\rm -rf $EXT_DIR/diff* $EXT_DIR/pattern* $EXT_DIR/*.log *.log $EXT_DIR/rules/*/*.log

export REF_EXTRATOR=spef_extractor
export EXT_DIR=./openrcx-$REF_EXTRATOR

\rm -rf $EXT_DIR/diff* $EXT_DIR/pattern* $EXT_DIR/*.log *.log $EXT_DIR/rules/*/*.log

