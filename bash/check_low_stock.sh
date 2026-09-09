#!/bin/bash

result=$(psql -X -p 5434 -d book_shop -t -A -c "
SELECT title, store_name, quantity 
FROM books 
JOIN inventory ON books.book_id = inventory.book_id 
JOIN stores ON inventory.store_id = stores.store_id 
WHERE quantity < 5;")


if [ -z "$result" ] 
then
   echo "All books are in stock"
else
   echo "$result"
fi
