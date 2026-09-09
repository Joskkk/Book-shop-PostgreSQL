#!/bin/bash
psql -d book_shop -c "SELECT pg_size_pretty(pg_database_size('book_shop'));"
