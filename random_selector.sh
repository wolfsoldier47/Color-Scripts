#!/bin/bash

DEFAULT_DIRECTORY="./color-scripts"

# Use the provided directory or fall back to the default
DIRECTORY="${1:-$DEFAULT_DIRECTORY}"

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY does not exist."
    exit 1
fi

files=("$DIRECTORY"/*)
executable_files=()

for file in "${files[@]}"; do
    if [ -x "$file" ]; then
        executable_files+=("$file")
    fi
done

if [ ${#executable_files[@]} -eq 0 ]; then
    echo "No executable files found in $DIRECTORY."
    exit 1
fi

random_file="${executable_files[RANDOM % ${#executable_files[@]}]}"

# Execute the selected file
"$random_file"
