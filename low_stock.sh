#!/bin/bash
psql -d book_shop -c "
SELECT title, quantity
FROM books
JOIN inventory
ON books.book_id = inventory.book_id
WHERE quantity <= 5;"
