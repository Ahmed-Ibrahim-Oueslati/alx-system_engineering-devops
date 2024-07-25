#!/bin/bash
# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Create a temporary file to store the modified content
tmpfile=$(mktemp)

# Append a tab to the start of the line at index i with the condition:
# i - 1 = '{'
# i + 1 = '}'

awk '
{
  lines[NR] = $0
}
END {
  for (i = 1; i <= NR; i++) {
    if (i > 1 && i < NR && lines[i-1] ~ /{/ && lines[i+1] ~ /}/) {
      print "\t" lines[i]
    } else {
      print lines[i]
    }
  }
}
' "$1" > "$tmpfile"

# Overwrite the original file with the modified content
mv "$tmpfile" "$1"
