#!/usr/bin/env bash

# Usage: ./merge_srt.sh /path/to/start output.txt

START_DIR="$1"
OUTPUT_FILE="$2"

if [[ -z "$START_DIR" || -z "$OUTPUT_FILE" ]]; then
    echo "Usage: $0 /start/directory output.txt"
    exit 1
fi

# Clear or create output file
> "$OUTPUT_FILE"

# Find all SRT files recursively, sorted for consistent order
find "$START_DIR" -type f -iname "*.srt" | sort | while read -r file; do
    echo "---- FILE: $file ----" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
done

echo "Done! Output saved to: $OUTPUT_FILE"
