#!/bin/bash

# Define the directory to start the search from (you can change this to your desired directory).
SEARCH_DIR="/home/vishnu"


# Define the output file.
OUTPUT_FILE="top_10_biggest_files.txt"

# Use the find command to search for files and du to calculate file sizes.
# Sort the results by file size in descending order and take the top 10.
find "$SEARCH_DIR" -type f -exec du -h {} + | sort -rh | head -n 10 > "$OUTPUT_FILE"

# Check if the output file was created successfully.
if [ -e "$OUTPUT_FILE" ]; then
    echo "Top 10 biggest files are written to $OUTPUT_FILE:"
    cat "$OUTPUT_FILE"
else
    echo "An error occurred while creating the output file."
fi  
