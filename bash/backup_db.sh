#!/bin/bash

mkdir -p /home/student/book_shop/backups
backup_file="/home/student/book_shop/backups/backup_$(date +%Y-%m-%d_%H-%M-%S).sql"
pg_dump -d book_shop -f "$backup_file"

if [ $? -eq 0 ]
then
   echo "Backup completed successfully"
else
   echo "Backup failed"
fi
