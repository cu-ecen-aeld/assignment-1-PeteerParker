#!/bin/bash

# Verify two arguments passed
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: writefile writestr"
    exit 1
fi

writefile="$1"
writestr="$2"

# Obtein file directory
writedir=$(dirname "$writefile")

# Create directory if does not exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory $writedir"
    exit 1
fi

# Write the chain in the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file $writefile"
    exit 1
fi

exit 0
