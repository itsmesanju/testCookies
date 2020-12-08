mkdir -p /root/monitoring/
tail -fn0 /var/log/messages |  while read line
do

echo "$line" | grep "MY PATTERN"
if [ $? = 0 ]
then
     echo "Pattern detected at `date` ">/root/monitoring/data.txt
     echo $line  >>/root/monitoring/data.txt
     #More action come here; send mail etc.
fi
done

