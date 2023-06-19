#!/bin/bash
declare -A openfiles

while IFS=$'\n' read l; do
  openfiles[$l]=1
done < <(find /proc -mindepth 2 -type l -regex '/proc/[0-9]+/fd/.*' \
           -exec realpath {} + 2>/dev/null |
         grep -vE '/(socket|pipe|anon_inode):' | sort -u)
exit