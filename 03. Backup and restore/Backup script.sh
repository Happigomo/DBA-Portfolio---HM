#!/bin/bash
# Database Backup Script

DB_NAME="ecommerce_db"
DB_USER="db_user"
DB_HOST="localhost"
BACKUP_DIR="/var/backups/mysql"
DATE=$(date +%Y%m%d_%H%M%S)
 "" 
mkdir -p $BACKUP_DIR

mysqldump -u $DB_USER -p -h $DB_HOST $DB_NAME > $BACKUP_DIR/${DB_NAME}_$DATE.sql

echo "Backup completed: $BACKUP_DIR/${DB_NAME}_$DATE.sql"