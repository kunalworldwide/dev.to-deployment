#!/bin/bash

# Use the current directory as the directory containing the markdown files
MARKDOWN_DIR="."

# Header components to check
header_components=(
    "^---$"
    "^title: .+"
    "^published: .+"
    "^description: .+"
    "^tags: .+"
    "^cover_image: .+"
    "^canonical_url: .+"
    "^id: .*"  # Allow 'id' to be empty
    "^---$"
)

# Counter for files that do not match the required format
count=0

# Change the Internal Field Separator to newline
IFS=$'\n'

# Loop through all markdown files
for file in $(find "$MARKDOWN_DIR" -name '*.md'); do
    # Read the content of the file
    content=$(cat "$file")

    # Check for each header component
    missing_component=false
    for component in "${header_components[@]}"; do
        if ! grep -Pq "$component" <<< "$content"; then
            echo "Missing or incorrect in \"$file\": $component"
            missing_component=true
        fi
    done

    if [ "$missing_component" = true ]; then
        echo "The file \"$file\" does not have the required Markdown header format."
        count=$((count+1))
    fi
done

# Check if any files failed the check
if [ $count -ne 0 ]; then
    echo "There are $count files without the required header format."
    exit 1
else
    echo "All Markdown files have the required header format."
fi




