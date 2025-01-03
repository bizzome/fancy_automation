#!/bin/bash

# Define the cron job
CRON_JOB="0 10 * * * cd /fancy_automation && python update_number.py"

# Check if the cron job already exists
crontab -l | grep -F "$CRON_JOB" > /dev/null
if [ $? -eq 0 ]; then
  echo "The cron job is already set up."
else
  # Add the cron job
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
  echo "The cron job has been added."
fi