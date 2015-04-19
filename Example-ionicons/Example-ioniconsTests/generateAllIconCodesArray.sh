#!/bin/sh

#  generateAllIconsArray.sh
#  Example-ionicons
#
#  Created by Daniel Morgan on 4/18/15.

# This will create an array of NSStrings representing all the icon unicode values. 
# This is mainly useful for testing, in order to ensure that all of the codes offered by
# the library actually show a glyph.

SCRIPT_PATH="$(dirname "$0")" || .
CODES_PATH=$SCRIPT_PATH/../../ionicons/ionicons-codes.h
OUTPUT_PATH=$SCRIPT_PATH/allIconCodes.h

if [[ -f "$OUTPUT_PATH" ]]; then
  rm "$OUTPUT_PATH"
fi

echo '//' > $OUTPUT_PATH
echo '// This file is auto-generated by generateAllIconCodesArray.sh' >> $OUTPUT_PATH
echo '// It contains all icon codes for testing purposes.' >> $OUTPUT_PATH
echo '//' >> $OUTPUT_PATH
echo '' >> $OUTPUT_PATH
echo '#import <Foundation/Foundation.h>' >> $OUTPUT_PATH
echo '#import "ionicons-codes.h"' >> $OUTPUT_PATH
echo '' >> $OUTPUT_PATH
echo 'static NSArray *allIconCodes() {' >> $OUTPUT_PATH

OUTPUT_STRING="return @["
while read line; do
    OUTPUT_STRING=${OUTPUT_STRING}"$(echo $line | awk -F ' ' '{print $2}'), "
done <$CODES_PATH
OUTPUT_STRING="${OUTPUT_STRING}];"

echo ${OUTPUT_STRING} >> $OUTPUT_PATH
echo "}" >> $OUTPUT_PATH
