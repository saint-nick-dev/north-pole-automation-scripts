#!/bin/bash

MAX_CAPACITY=50000  
MANIFEST="gift_manifest.txt"
 
total=0
 

while read -r gift qty size; do
    volume=$(( qty * size ))
    total=$(( total + volume ))
    echo "Loaded ${qty}x ${gift} (${volume} cu ft)"
done < "$MANIFEST"
 
percent=$(( total * 100 / MAX_CAPACITY ))
 
echo "----------------------------------"
echo "Total volume: ${total} / ${MAX_CAPACITY} cu ft (${percent}%)"
 
if (( total > MAX_CAPACITY )); then
    echo "WARNING: Bag over capacity! Schedule a second sleigh run."
else
    echo "Bag is good to go. Ho ho ho!"
fi
 
