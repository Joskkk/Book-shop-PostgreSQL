#!/bin/bash

psql -d book_shop -c"
SELECT c.relname,
       pg_size_pretty(pg_total_relation_size(c.oid))
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'public'
  AND c.relkind = 'r'
  AND pg_total_relation_size(c.oid) > 10 * 1024
ORDER BY 2 DESC;"

if [ $? -ne 0 ]
then
   echo "Error: cannot get table sizes"
fi

