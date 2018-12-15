#!/bin/bash
# THIS IS A SCRIPT TO GRAB IMPORTANT INFO FROM LOG FILES

NOW=$( date '+%s' )
REF=$(( $NOW - 15*60 ))


while true; do
while read MONTH DAY HMS A4 ; do

	TIMESTAMP=$(date --date "${MONTH} ${DAY} ${HMS} ${A4}" '+%s')
	if [[ "$TIMESTAMP" -ge "$REF" ]] ; then
		echo "${MONTH} ${DAY} ${HMS} ${A4}"
			
	fi

done < /var/log/auth.log | tail | grep 'Accept'
sleep 10
done
