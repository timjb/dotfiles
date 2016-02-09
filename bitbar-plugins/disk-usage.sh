#!/bin/bash

# <bitbar.title>Disk Usage</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>Tim Baumann</bitbar.author>
# <bitbar.author.github>timjb</bitbar.author.github>
# <bitbar.desc>This plugin shows the amount of free disk space.</bitbar.desc>
# <bitbar.image></bitbar.image>
# <bitbar.dependencies></bitbar.dependencies>

space_info=$(df -h / | tail -n 1)
free_space=$(echo $space_info | awk '{print $4}')
pct_used=$(echo $space_info | awk '{print $8}')

echo "$free_space"
echo "---"
echo "Used space: $pct_used"
