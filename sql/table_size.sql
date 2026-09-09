SELECT c.relname, pg_size_pretty(pg_total_relation_size(c.oid)) AS size
FROM pg_class c
JOIN pg_namespace n on c.relnamespace = n.oid
WHERE n.nspname LIKE 'public' AND c.relkind = 'r'
ORDER BY 2 DESC;
