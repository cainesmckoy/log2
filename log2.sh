#!/bin/bash
# THIS IS A SCRIPT TO GRAB IMPORTANT INFO FROM LOG FILES
#COPY SCRIPT AS log2-1.sh
#REMOVE -1 in log2-1.sh

sudo pkill -9 log2-1.sh
NOW=$( date '+%s' )
REF=$(( $NOW - 15*60 ))

while read MONTH DAY HMS A4 ; do

	TIMESTAMP=$(date --date "${MONTH} ${DAY} ${HMS}" '+%s')
	if [[ "$TIMESTAMP" -ge "$REF" ]] ; then
		echo "${MONTH} ${DAY} ${HMS} ${A4}"
			
	fi

done < /var/log/auth.log | grep 'Accept'
sleep 15
sudo ./log2-1.sh
