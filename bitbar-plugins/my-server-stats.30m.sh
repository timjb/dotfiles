#!/bin/bash

# <bitbar.title>My Server Stats</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>Tim Baumann</bitbar.author>
# <bitbar.author.github>timjb</bitbar.author.github>
# <bitbar.desc>This plugin shows information about my server.</bitbar.desc>
# <bitbar.image></bitbar.image>
# <bitbar.dependencies></bitbar.dependencies>

login="root@46.101.152.168"

space_info=$(ssh $login "df -h / | tail -n 1")
free_space=$(echo $space_info | awk '{print $4}')
pct_used=$(echo $space_info | awk '{print $5}')

mem_info=$(ssh $login "free -m | grep Mem")
free_ram=$(echo $mem_info | awk '{print $4}')

echo "Server"
echo "---"
echo "Free space: $free_space"
echo "Used space: $pct_used"
echo "Free RAM: ${free_ram}MB"
echo "---"
echo "Open Sandstorm | href=http://timjb.sandcats.io:6080/grain"
echo "Open Seafile | href=http://46.101.152.168:8000"
echo "---"
echo "Open SSH terminal | bash=ssh param1=$login terminal=true"

