#!/bin/bash


API_URL="https://esn.northpole.local/api/reports"
OUTFILE="naughty_nice_list.csv"
NICE_THRESHOLD=70
curl -s -H "Authorization: Bearer ${NORTH_POLE_API_TOKEN}" "$API_URL" -o reports.txt
 
echo "name,score,status" > "$OUTFILE"
 

while read -r name good tantrums; do
    score=$(( good * 2 - tantrums * 3 ))
 
    if (( score >= NICE_THRESHOLD )); then
        status="NICE"
    else
        status="NAUGHTY"
    fi
 
    echo "${name},${score},${status}" >> "$OUTFILE"
done < reports.txt
 
echo "List saved to $OUTFILE. Santa will check it twice."
  
