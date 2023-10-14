#!/bin/bash

# Function to monitor CPU, memory, and disk usage
monitor_resources() {
    # Define thresholds as floating-point numbers (adjust as needed)
    cpu_threshold=90.0  # Alert if CPU usage exceeds 90%
    mem_threshold=90.0  # Alert if memory usage exceeds 90%
    disk_threshold=90.0 # Alert if disk usage exceeds 90%

    # Get current date and time
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Get CPU usage (top command)
    cpu_usage=$(top -bn1 | awk '/^%Cpu/ {print $2}')

    # Get memory usage (free command)
    mem_info=$(free | awk '/Mem:/ {print ($3/$2) * 100}')

    # Get disk usage (df command)
    disk_info=$(df --output=pcent / | awk 'NR==2 {print $1}' | sed 's/%//')

    # Check if any resource exceeds the threshold
    if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )) || \
       (( $(echo "$mem_info > $mem_threshold" | bc -l) )) || \
       (( $(echo "$disk_info > $disk_threshold" | bc -l) )); then

        # Log resource usage to a file in table format
        echo "$timestamp | CPU: $cpu_usage% | Memory: $mem_info% | Disk: $disk_info%" >> resource_log.txt

        # Send an alert (you can replace this with your own alerting mechanism)
        echo "ALERT: Resource usage exceeded threshold at $timestamp"
    else
        # Log resource usage to a file without alerts
        echo "$timestamp | CPU: $cpu_usage% | Memory: $mem_info% | Disk: $disk_info%" >> resource_log.txt
    fi
}

# Run the monitoring function
monitor_resources
