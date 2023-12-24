#!/bin/bash

# Check if a directory is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 /path/to/pendrive"
    exit 1
fi

# Ensure the provided path is a directory
pendrive_path="$1"
if [ ! -d "$pendrive_path" ]; then
    echo "Error: $pendrive_path ain't a directory."
    exit 1
fi

echo "Doing your homework $pendrive_path ..."

# Measure the time it takes to find the largest files
start_time=$(date +%s.%N)
largest_files=$(find "$pendrive_path" -type f -exec du -h {} + | sort -rh | head -n 10)
end_time=$(date +%s.%N)

# Display the largest files and the time it took
echo -e "\nTop 10 largest files:"
echo "$largest_files"
echo -e "\nTime taken: $(echo "$end_time - $start_time" | bc) seconds"
echo "Done."


© hardikkum444
