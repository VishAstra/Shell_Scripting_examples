-------TASK -------

Write a shell script to automate the process of rotating log files and compressing old files to save disk space#make it executable using 

chmod +x log_file_compression.sh

#Then you can run it:

./log_file_compression.sh
---------------------------------------------------------------------------------------------------------------------------------------------
In this script:

▶️ Set log_dir to the directory containing your log files.
▶️ max_log_files defines the maximum number of log files to keep before rotating and compressing old logs.
▶️ The script first checks if the log directory exists and then navigates to it.
▶️ It renames the current log file (app.log) to app.log.YYYYMMDD with the current timestamp.
▶️ It compresses old log files, keeping the last max_log_files - 1 files. Older files are gzip-compressed.
▶️ Log files older than 10 days are removed. You can adjust this value as needed.

▶️ Make sure to replace app.log with the actual log file name used in your application. Also, add any relevant log rotation logic specific to your application if necessary (e.g., restarting services).
▶️ Finally, you can schedule this script to run periodically using cron to automate log rotation and compression.
