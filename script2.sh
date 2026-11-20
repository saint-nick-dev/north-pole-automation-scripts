#!/bin/bash

today=$(date +%F)         
year=$(date +%Y)
christmas="$year-12-25"

if [[ "$today" > "$christmas" ]]; then
  year=$(( year + 1 ))
  christmas="$year-12-25"
fi

seconds_left=$(( $(date -u -d "$christmas" +%s) - $(date -u -d "$today" +%s) ))
days=$(( seconds_left / 86400 ))

if (( days == 0 )); then
  echo "It's Christmas Day! Merry Christmas!"
elif (( days == 1 )); then
  echo "Only 1 day until Christmas! Go to sleep! Tomorrow Santa Comes!!!!"
else
  echo "$days days until Christmas $year"
fi
