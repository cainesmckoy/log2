#script to aggreagte multiple logs
#caine munro
NOW=$( date '+%s' )
REF=$(( $NOW - 15*60 ))
while read MONTH DAY HMS A4 ; do

	TIMESTAMP=$(date --date "${MONTH} ${DAY} ${HMS} ${A4}" '+%s')
	if [[ "$TIMESTAMP" -ge "$REF" ]] ; then
		echo "${MONTH} ${DAY} ${HMS} ${A4}"
			
	fi
#THe access and erros logs had to be set to chmod 660
the script always deletes the previous log
sudo rm final_log.txt
echo "errors" > final_log.txt
echo "--------------------------------------------------------------------------------------------"
sudo grep 'error' /var/log/secure | sort -u >> final_log.txt
echo "warnings" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'warning'  /var/log/secure | sort -u >> final_log.txt

echo "errors" > final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'error' /var/log/cron | sort -u >> final_log.txt

echo "warnings" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'warning'  /var/log/cron | sort -u >> final_log.txt

echo "errors" > final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'error' /var/log/messages | sort -u >> final_log.txt
echo "warnings" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'warning'  /var/log/messages | sort -u >> final_log.txt

echo "errors" > final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'error' /var/log/syslog| sort -u >> final_log.txt
echo "warnings" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'warning'  /var/log/syslog | sort -u >> final_log.txt
echo "errors" > final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'error' /var/log/apache2/access.log | sort -u >> final_log.txt
echo "warnings" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'warning'  /var/log/apache2/access.log | sort -u >> final_log.txt
echo "errors" >> final_log.txt
echo "--------------------------------------------------------------------------------------------"

sudo grep 'error'  /var/log/apache2/error.log | sort -u >> final_log.txt
echo "warnings" >> final_log.txt
done < /var/log/apache2/error.log | grep 'warning' | sort -u >> final_log.txt
