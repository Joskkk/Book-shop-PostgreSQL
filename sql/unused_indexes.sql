SELECT i.relname, i.indexrelname, i.idx_scan
FROM pg_stat_user_indexes i
WHERE i.schemaname = 'public' AND i.idx_scan = 0
ORDER BY 1;
