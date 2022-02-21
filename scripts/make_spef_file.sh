#!/bin/bash
#
# make_spef_file.sh ---
#
#	Script to generate a .spef file from a pattern layout (in DEF format)
#	for openRCX using magic
#
# Usage:
#
#	make_spef_file.sh <DEF_file>

if test "$#" -ne 1 ; then
    echo "Usage: make_spef_file.sh <def_file_name>"
    exit 0
fi

export PDK_ROOT=/usr/share/pdk
export PDK_PATH=${PDK_ROOT}/sky130A

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

designname=`cat $1 | grep ^DESIGN | cut -d' ' -f 2`

echo "Extracting design $designname from $1 using magic"
magic -dnull -noconsole -rcfile ${PDK_PATH}/libs.tech/magic/sky130A.magicrc << EOF
drc off
crashbackups stop
lef read ${PDK_PATH}/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
def read $1
extract do aliases
extract do local
extract all
quit -noprompt
EOF

echo "Converting design $designname to SPEF"
${SCRIPT_DIR}/ext2spef.py ${designname}.ext ${designname}.spef
rm -f ${designname}.ext

echo "Done!"
exit 0
