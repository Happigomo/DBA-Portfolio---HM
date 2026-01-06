#!/bin/bash
# Database Restore Script

DB_NAME="ecommerce_db"
DB_USER="db_user"
DB_HOST="localhost"
BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: ./Restore script.sh <backup_file.sql>"
  exit 1
fi

mysql -u $DB_USER -p -h $DB_HOST $DB_NAME < $BACKUP_FILE

echo "Restore completed from: $BACKUP_FILE"