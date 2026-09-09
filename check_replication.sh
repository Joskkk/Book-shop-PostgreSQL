#!/bin/bash

read -p "Enter PostgreSQL port: " port
result=$(psql -X -p "$port" -t -A -c "SELECT pg_is_in_recovery();")
status=$?

if [ "$status" -ne 0 ]
then
  echo "Error: cannot connect to PostgreSQL"
elif [ "$result" = "t" ]
then
  echo "PostgreSQL is standby"
else
  echo "PostgreSQL is primary"
fi
