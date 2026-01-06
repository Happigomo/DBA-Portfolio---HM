#!/bin/bash
# Cleanup old log files
find /var/log/mysql -type f -mtime +7 -delete
echo "Old logs cleaned."