#!/bin/bash

source .env   

SERVERS=("lego-forge-01" "doll-assembly-02" "teddy-stuffing-03" "wrapping-04")

for server in "${SERVERS[@]}"; do
  if (( RANDOM % 5 == 0 )); then
    echo "$server is DOWN"
  else
    days=$(( RANDOM % 300 ))
    echo "$server is up (uptime: $days days)"
  fi
done
