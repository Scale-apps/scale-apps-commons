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

# Array of subfolders to exclude. Currently it is excluding only Elixir project. May need to add Java and Python specific exclusions
exclude_subfolders=("node_modules" "deps")

# Use rsync to copy files from source to destination, preserving subfolder structure and only copying existing files
rsync -a --exclude="${exclude_subfolders[0]}" --exclude="${exclude_subfolders[1]}" --existing "$source_folder/" "$destination_folder/"

echo "Done."
