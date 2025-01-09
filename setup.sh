#!/bin/bash

# Define the cron job
CRON_JOB="0 10 * * * cd ~/Programas/fancy_automation && ~/Programas/fancy_automation/venv/bin/python number_job.py >> ~/Programas/fancy_automation/number_job.log 2>&1"

# Check if the cron job already exists
crontab -l | grep -F "$CRON_JOB" > /dev/null
if [ $? -eq 0 ]; then
  echo "The cron job is already set up."
else
  # Add the cron job
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
  echo "The cron job has been added."
fi