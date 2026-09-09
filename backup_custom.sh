#!/bin/bash

backup_file="/home/student/book_shop/backups/backup_$(date +%Y-%m-%d_%H-%M-%S).dump"
pg_dump -d book_shop -F c -f "$backup_file"

if [ $? -eq 0 ]
then
  echo "Custom backup completed successfully"
else
  echo "Custom backup failed"
fi
