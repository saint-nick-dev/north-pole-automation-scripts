#!/bin/bash

file="${1:-wishlist.txt}"

# Make sure the file exists
if [ ! -f "$file" ]; then
  echo "Can't find $file"
  exit 1
fi

echo "Top 5 most wished-for toys:"
echo

sort "$file" | uniq -c | sort -nr | head -5 | while read -r count toy; do
  echo "  $count x $toy"
done
