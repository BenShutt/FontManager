#!/bin/bash -e

# Font file extension
EXTENSION=ttf

# URL to clone
CLONE_URL=https://github.com/BenCShutt/FontManager.git

# Name of the app to run
APP_NAME=FontManagerApp

# Get the directory of the script file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT_DIRECTORY=${DIR}

# Base directory
PWD=$(pwd)
BASE_DIRECTORY=${PWD}

# Directory to clone into
CLONE_DIRECTORY=${BASE_DIRECTORY}/${APP_NAME}

# Handle cases when there are no matching files
shopt -s nullglob

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
    rm -rf ${CLONE_DIRECTORY}
}

trap cleanup EXIT

# Clean and recreate
cleanup

# Download the files needed
git clone ${CLONE_URL} ${CLONE_DIRECTORY}
cd ${CLONE_DIRECTORY}/${APP_NAME}

swift run ${APP_NAME} ${FONT_DIRECTORY}

# Finally clean up
cleanup
