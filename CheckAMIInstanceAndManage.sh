#!/bin/bash
#MY_EC2_PRKY=$HOME/.ec2/pk-PrivateKey.pem
#MY_EC2_CERT=$HOME/.ec2/cert-EC2cert.pem
#MY_ZONE="us-west-2"
export EC2_KEYPAIR=$HOME/.ec2/AmazonEC2.pem
export EC2_PRIVATE_KEY=$HOME/.ec2/pk-PrivateKey.pem
export EC2_CERT=$HOME/.ec2/cert-EC2cert.pem
export EC2_URL=https://ec2.us-west-2.amazonaws.com
AMI_UBUNTU="ami-7eaecc4e"
AMI_AMAZON="ami-ccf297fc"
AMI_TEMP_DATA="/tmp/AMI_run_data.txt"

if [ "$1" = "-h" ] ; then
                echo "AMI Management Utility "
                echo "Usage: $0 [ AMAZON | UBUNTU ]"
                echo ""
        exit
fi

INSTANCE_TYPE=$1
if [ "$INSTANCE_TYPE" = "AMAZON" ]; then
AMI_ID=$AMI_AMAZON
else if [ "$INSTANCE_TYPE" = "UBUNTU" ]; then
AMI_ID=$AMI_UBUNTU
	else
	echo "INVALID ARGUMENT. Use -h for more details"
	exit;
	fi
fi

ec2-describe-instances |grep "running" |grep $AMI_ID >/tmp/AMI_run_data.txt
echo "Total running instances of AMI type $1 ($AMI_ID)are : `wc -l /tmp/AMI_run_data.txt |awk '{ print $1}'` "
if [ -s /tmp/AMI_run_data.txt ]; then

cat /tmp/AMI_run_data.txt | while read line; do
	INSTANCE_ID=`echo $line |awk '{ print $2}'`
	echo "Stopping instance $INSTANCE_ID"
	ec2-stop-instances $INSTANCE_ID
done
ec2-describe-instances |grep "running" |grep $AMI_ID >/tmp/AMI_run_data.txt
echo "Verifying instances status: Current running are `wc -l /tmp/AMI_run_data.txt |awk '{ print $1}'` "
if [ -s /tmp/AMI_run_data.txt ]; then
echo "[31mAll instances are not stopped due to some error! Please analyze in details[0m "
else
echo "[32mAll instances are stopped![0m "
fi
else
echo "No instances is running! Noting to do now [34m:( [0m "
fi

