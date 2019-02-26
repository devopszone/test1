#!/bin/bash
# 

sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[elastic-6.x]
name=Elastic repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

sudo yum install filebeat
sudo yum install metricbeat -y 
sudo yum install heartbeat-elastic -y 
sudo yum install packetbeat -y 
sudo yum install auditbeat -y 
 
sudo chkconfig --add filebeat
sudo chkconfig --add metricbeat
sudo chkconfig --add packetbeat
sudo chkconfig --add auditbeat
