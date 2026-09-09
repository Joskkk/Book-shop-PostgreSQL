SELECT pg_is_in_recovery() AS standby,
	CASE
	WHEN pg_is_in_recovery() THEN (SELECT flushed_lsn::text FROM pg_stat_wal_receiver)
	ELSE (SELECT count(*)::text FROM pg_stat_replication r WHERE r.state = 'streaming')
	END AS result;
