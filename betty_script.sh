#!/bin/bash
# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Create a temporary file to store the modified content
tmpfile=$(mktemp)

# Remove leading spaces from each line and store in the temporary file
sed 's/^ *//' "$1" > "$tmpfile"

# Overwrite the original file with the modified content
mv "$tmpfile" "$1"
