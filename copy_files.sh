#!/bin/bash

# Define the source and destination folders
echo "Copying files from $1 to $2"
source_folder="$1"
destination_folder="$2"

# Check if both folders exist
if [ ! -d "$source_folder" ] || [ ! -d "$destination_folder" ]; then
  echo "Source or destination folder does not exist."
  exit 1
fi

# Iterate through files in the source folder recursively
find "$source_folder" -type f | while read -r source_file; do
  # Get the file name without the path
  file_name=$(basename "$source_file")

  # Check if a file with the same name exists in the destination folder
  if [ -e "$destination_folder/$file_name" ]; then
    # If a file with the same name exists, copy the file from source to destination
    cp "$source_file" "$destination_folder/$file_name"
    echo "Copied: $file_name"
  fi
done

echo "Done."
