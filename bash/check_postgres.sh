#!/bin/bash

pg_isready 
if [ $? -eq 0 ]
then
  echo "PostgreSQL is available"
else 
  echo "PostgreSQL is not available"
fi
