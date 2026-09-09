#!/bin/bash

read -p "Backup file name:  " backup_file
pg_restore -p 5434 -d book_shop_books_test -t inventory "$backup_file"

if [ $? -eq 0 ]
then
  echo "Restore completed successfully"
else 
  echo "Restore failed"
fi
