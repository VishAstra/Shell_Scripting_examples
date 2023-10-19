-------TASK -------

Shell script to Copy files recursively to remote hosts.
chmod +x copy_files_to_remote_host.sh

#Then you can run it:

./copy_files_to_remote_host.sh
---------------------------------------------------------------------------------------------------------------------------------------------
In this script:

In this script:

  >  Replace /path/to/source/directory with the path to your source directory.
  >  Replace /path/to/destination/directory with the path to the destination directory on the remote hosts.
  >  Add the list of remote hosts to the hosts array. Make sure to provide the appropriate SSH usernames and hostnames or IP addresses.
  >  The script uses a for loop to iterate through each remote host and uses scp -r to copy files and directories recursively to the remote host.

  >  Make sure that SSH key-based authentication is properly set up between the local machine and the remote hosts to avoid password prompts during the copy process.
