#!/bin/bash

# Verify two arguments passed
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: filesdir searchstr"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Verify filesdir existence as valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory"
    exit 1
fi

# Count number of files in the chain
num_files=$(grep -rl -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Count total lines that match
num_lines=$(grep -rn -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_lines"

exit 0
