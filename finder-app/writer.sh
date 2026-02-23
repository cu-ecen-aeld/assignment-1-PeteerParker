#!/bin/sh

# Validate number of arguments
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 writefile writestr"
    exit 1
fi

writefile="$1"
writestr="$2"

# Extract directory path from full file path
writedir=$(dirname "$writefile")

# Create directory path if it doesn't exist
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir" || {
        echo "Error: Could not create directory path $writedir"
        exit 1
    }
fi

# Write string to file (overwrite if exists)
echo "$writestr" > "$writefile" || {
    echo "Error: Could not create or write to file $writefile"
    exit 1
}

exit 0
