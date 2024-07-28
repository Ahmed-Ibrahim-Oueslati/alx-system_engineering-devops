#!/bin/bash
base_name=$(basename "$1" .c)
gcc "$1" -o "$base_name"
./"$base_name"