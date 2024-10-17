#!/bin/bash

# Directory containing the images
SOURCE_DIR="images/"
# Directory to save the converted WebP images
OUTPUT_DIR="images-webp/"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each image in the source directory
for img in "$SOURCE_DIR"/*.{jpg,jpeg,png,bmp,tiff,gif,JPEG,PNG,JPG}; do
    # Check if the file exists to avoid wildcards when no matching files
    if [[ -f "$img" ]]; then
        # Extract filename without extension
        filename=$(basename "$img")
        # Get file name without extension
        base_name="${filename%.*}"

        # Convert image to WebP
        cwebp "$img" -o "$OUTPUT_DIR/$base_name.webp"
        echo "Converted: $img -> $OUTPUT_DIR/$base_name.webp"
    fi
done
