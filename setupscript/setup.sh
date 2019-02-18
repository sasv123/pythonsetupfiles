#!/bin/bash
# Parse arguments
if [ `grep 'isMaster' /mnt/var/lib/info/instance.json | awk -F ':' '{print $2}' | awk -F ',' '{print $1}'` = 'true' ]; then
	echo "This is the master node, executing."
        s3_bucket_script="$1/root.tar.gz"
	# Download compressed script tar file from S3
	aws s3 cp $s3_bucket_script /home/hadoop/script.tar.gz
	# Untar file
	#tar xzvf "/home/susovan/Downloads/root.tar.gz" -C /home/susovan/Downloads/setup
	tar zxvf "/home/hadoop/script.tar.gz" -C /home/hadoop/
	# Install requirements for additional Python modules (uncomment if needed)
	# sudo python2.7 -m pip install pandas
	exit 0
fi

