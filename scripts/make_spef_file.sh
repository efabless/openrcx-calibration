#!/bin/sh
#
# make_spef_file.sh ---
#
#	Script to generate a .spef file from a pattern layout (in DEF format)
#	for openRCX using magic
#
# Usage:
#
#	make_spef_file.sh <DEF_file> [<corner>]

if test "$#" -eq 0 ; then
    echo "Usage: make_spef_file.sh <def_file_name> [<corner>]"
    echo "    where <corner> is 'nom' (default), 'min', or 'max'".
    exit 0
fi

# Default extraction style is nominal
extstyle="'ngspice()'"
corner="nominal"

if test "$#" -eq 2 ; then
    corner="$2"
    if test "$2" = "min" ; then
	extstyle="ngspice\(lrlc\)"
        corner="minimum"
    elif test "$2" = "max" ; then
	extstyle="ngspice\(hrhc\)"
        corner="maximum"
    fi
fi

#
# These values can be overridden from the environment
#
export PDK_ROOT=${PDK_ROOT:=/foss/pdk}
export PDK=${PDK:=sky130A}
export PDK_PATH=${PDK_ROOT}/${PDK}
export EXT_DIR=${EXT_DIR:=./openrcx-magic}
mkdir -p $EXT_DIR

export MAGIC=/foss/tools/bin/magic


#export TECH_LEF=${TECH_LEF:=$PDK_PATH/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__$CORNER.tlef}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

designname=`cat $1 | grep ^DESIGN | cut -d' ' -f 2`

echo "Extracting design $designname from $1 using magic, $corner corner"
$MAGIC -dnull -noconsole -rcfile ${PDK_PATH}/libs.tech/magic/${PDK}.magicrc << EOF
drc off
crashbackups stop
lef read ${TECH_LEF}
def read $1
extract style $extstyle
extract do aliases
extract do local
extract all
quit -noprompt
EOF


echo "eeeeeeeeeeeeeeeeeee $2"

mv ${designname}.ext $EXT_DIR/${designname}.$PDK.$2.ext


echo "Converting design $designname to SPEF"
${SCRIPT_DIR}/ext2spef.py ${EXT_DIR}/${designname}.${PDK}.$2.ext $EXT_DIR/${designname}.${PDK}.$2.spef

echo "Done!"
exit 0
