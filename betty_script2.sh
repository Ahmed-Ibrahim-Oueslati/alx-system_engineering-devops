#!/bin/bash
# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Create a temporary file to store the modified content
tmpfile=$(mktemp)

# Process the input file
while IFS= read -r line; do
    # Check if the line ends with '{'
    if [[ $line =~ \{$ ]]; then
        # Append the brace to the next line
        echo "${line%?}" >> "$tmpfile"
        echo "{" >> "$tmpfile"
    else
        # Otherwise, simply append the line
        echo "$line" >> "$tmpfile"
    fi
done < "$1"

# Overwrite the original file with the modified content
mv "$tmpfile" "$1"
