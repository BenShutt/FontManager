#!/bin/bash -e

# Font file extension
EXTENSION=ttf

# Directory to run process in. 
# WARNING: This will be deleted when the process starts, so ensure there are no
# other directories with this name you want to keep!
RUN_DIRECTORY=swiftFontManager

# Handle cases when there are no matching files
shopt -s nullglob

# Get the directory of the script file
PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT_DIRECTORY=${PWD}

# Get directory of input
read -p "Enter font directory path: " FONT_DIRECTORY

# Check directory exists
if [ ! -d "${FONT_DIRECTORY}" ]; then
    echo "'${FONT_DIRECTORY}' directory does not exist"
    exit 1
fi

# Get the files of the valid extension type
FONT_FILES=( ${FONT_DIRECTORY}/*.${EXTENSION} )
if [ ${#FONT_FILES[@]} -eq 0 ]; then
    echo "No files matching extension: '${EXTENSION}' in directory: '${FONT_DIRECTORY}'"
    exit 1
fi

# Echo files
echo "Found the following '${EXTENSION}' files in '${FONT_DIRECTORY}':"
for file in "${FONT_FILES[@]}"; do
    echo "$file"
done

# Prepare clean up
function cleanup {
    rm -rf ${SCRIPT_DIRECTORY}/${RUN_DIRECTORY}
}

trap cleanup EXIT

# Clean and recreate
cleanup
mkdir -p ${RUN_DIRECTORY}

# Move into it
cd ${RUN_DIRECTORY}

# Download the files needed
echo "TODO: Get from Github"

# Finally clean up
cd ..
cleanup


