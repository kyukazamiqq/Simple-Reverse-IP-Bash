#!/bin/bash 
#coded by kyu_kazami

echo "Simple Mass Reverse IP"
echo "Thanks to linuxsec for api"

LISTS=$1
RESULT=rev.txt

if [[ ! -f ${LISTS}  ]]; then 
	echo "${LISTS} Not found "
	echo "Usage : bash $0 list.txt"
	exit 
fi 

for WEBSITE in $(cat $LISTS);
do
	echo "Reversing... ${WEBSITE}"
	curl -s https://api.linuxsec.org/api/reverseipvhosts?host=${WEBSITE}|jq '.results'|tr -d ',  "[]' >>${RESULT}
done 
	echo "Done - Enjoy!"
