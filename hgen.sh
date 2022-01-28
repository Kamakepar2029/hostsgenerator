#!/bin/bash
range=$(cat range.txt)
nmap=$(nmap -sn $range | grep 'scan report' > l.txt)
lines=$(cat l.txt)
while read p; do
  ip=$(echo "$p" | awk '{print $6}' | tr -d '()' | tr -d ' ')
  hostname=$(echo "$p" | awk '{ print $5}')
  if [ "$ip" != "" ];
  then
	echo $ip'	'$hostname
  fi
done < l.txt
