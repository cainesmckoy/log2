#script to aggreagte multiple logs
#caine munro
NOW=$( date '+%s' )
REF=$(( $NOW - 15*60 ))
while read MONTH DAY  A4 ; do

	TIMESTAMP=$(date --date "${MONTH} ${DAY} " '+%s')
	if [[ "$TIMESTAMP" -ge "$REF" ]] ; then
		echo "${MONTH} ${DAY}  ${A4}"
			
	fi
#THe access and erros logs had to be set to chmod 660
echo "errors" >> final_log.txt
sudo grep 'error' | /var/log/apache2/access_log >> final_log.txt
echo "warnings" >> final_log.txt
sudo grep 'warning' | /var/log/apache2/access_log >> final_log.txt
echo "errors" >> final_log.txt
sudo grep 'error' | /var/log/apache2/error_log >> final_log.txt
echo "warnings" >> final_log.txt
done < /var/log/apache2/error_log | grep 'warning' >> final_log.txt
