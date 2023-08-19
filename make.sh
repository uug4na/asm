#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename.asm>"
    exit 1
fi

filename="$1"
output="${filename%.asm}"

# Assemble the code
nasm -f elf64 -o "${output}.o" "$filename"

if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

# Link the object file
ld -o "$output" "${output}.o"

if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi
rm "${output}.o"
# Run the binary
./"$output"

