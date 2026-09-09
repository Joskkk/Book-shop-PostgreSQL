SELECT current_database() AS database,
	current_setting('port') AS port,
	pg_size_pretty(pg_database_size(current_database())) AS size,
	(SELECT count(*) FROM pg_stat_activity WHERE datname = current_database()) AS connections,
	pg_is_in_recovery() AS standby;
