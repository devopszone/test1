#!/bin/bash
OS_Name=$(head -n 1 /etc/os-release|cut --complement -c 1-5|tr -d '"')
Redhat="Red Hat Enterprise Linux Server"
echo $OS_Name
echo $Redhat

if [ "$OS_Name" == "$Redhat" ] ;

then
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

sudo yum install telegraf -y
wget -O /etc/telegraf/telegraf.conf https://raw.githubusercontent.com/sravankumar-n/TICK_Setup/master/telegraf.conf 
sudo systemctl start telegraf

fi
