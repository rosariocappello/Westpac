#!/bin/bash

set -x 

# Check if a process name was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 process_name"
    exit 1
fi

# Store the process name
process_name="$1"

# Find the process by name and get its Process ID (PID)
pid=$(pgrep -f "$process_name")

# Check if a PID was found
if [ -z "$pid" ]; then
    echo "Process not found: $process_name"
    exit 1
fi

# Kill the process using the PID
kill $pid

# Check if the process was killed successfully
if [ $? -eq 0 ]; then
    echo "Process $process_name (PID: $pid) killed successfully."
else
    echo "Failed to kill process $process_name (PID: $pid)."
    exit 1
fi
exit