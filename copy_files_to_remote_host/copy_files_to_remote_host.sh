#!/bin/bash

# Define the source directory you want to copy
source_dir="/path/to/source/directory"

# Define the destination directory on remote hosts
destination_dir="/path/to/destination/directory"

# List of remote hosts (replace with your own)
hosts=("user1@remote-host1" "user2@remote-host2" "user3@remote-host3")

# Loop through each remote host
for host in "${hosts[@]}"; do
  # Use scp to copy files recursively to the remote host
  scp -r "$source_dir" "$host:$destination_dir"

  # Check the exit status of scp
  if [ $? -eq 0 ]; then
    echo "Files copied successfully to $host"
  else
    echo "Failed to copy files to $host"
  fi
done
