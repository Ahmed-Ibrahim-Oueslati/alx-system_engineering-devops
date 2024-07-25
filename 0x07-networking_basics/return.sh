#!/bin/bash

# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Create a temporary file to store the modified content
tmpfile=$(mktemp)

# Process the file line by line
while IFS= read -r line; do
  # Check if the line contains "return"
  if echo "$line" | grep -q 'return'; then
    # Extract the part after "return" and put it inside parentheses
    modified_line=$(echo "$line" | sed -E 's/return (.*);/return (\1);/')
    echo "$modified_line" >> "$tmpfile"
  else
    echo "$line" >> "$tmpfile"
  fi
done < "$1"

# Overwrite the original file with the modified content
mv "$tmpfile" "$1"
