#!/bin/bash
# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Create a temporary file to store the modified content
tmpfile=$(mktemp)

# check if it is an empty line , if yes delete it 
grep -v '^$' "$1" > "$tmpfile"

# Overwrite the original file with the modified content
mv "$tmpfile" "$1"