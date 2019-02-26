# Telegraf

This Directory contains files to install ansible and trigger the ansible playbook to install and configure telegraf plugins for various modules ex:(tomcat,apache,system) in different distributions of linux (Redhat,Ubuntu).

## How to use 
# Prerequisites
  Linux VMs (Currently supported Redhat,Debian) which needs to be monitored.                                                           
  InfluxDB                                                                         
  Grafana

# Step 1
Download the zip file and unzip the file.

  unzip telegraf.zip                                                                                                                     
  cd telegraf/                                                                                                                             
 # Step 2a
 Before using this script you have to update the inventory file with your values. 

Sample inventory file is available in telegraf directory.
 
 Given Below example performs installation of telegraf and configure default plugins(system moduels) on two hosts.

 If you are using different username and password for every host you have to define the values individually. 
 
 [hosts]                                                                                                                                 
ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com        ansible_user=ubuntu                                                                
ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com        ansible_user=ec2-user                                                                                                                

If you are using same username and password or key for all hosts you can define those values like below.

[hosts:vars]                                                                                                                             

ansible_ssh_private_key_file=/home/ec2-user/monitoring.pem                                                                               
ansible_connection=ssh                                                                                                                   
ansible_user=ec2-user                                                                                                             
ansible_password=ec2-user                                                   

# Step 2b
Update the influxdb URL and username/password.
                                                                                                            
influxdb_IP=influxdb                                               
influxdb_Port=8086                        
influxdb_DBName="javastack"                                                                                                             
influxdb_username="root"                                                                                                         
influxdb_password="root"                                                          

Update the Grafana URL and username/password.
                                                                                                            
grafana_IP=grafana                                               
grafana_Port=3000                        
grafana_username="user1"                                                                                                         
grafana_password="password" 


# Step 2c
Asume VM1 has tomcat and you want to monitor tomcat with telegraf.To Configure tomcat plugin update the host entriess under tomcat block as shown below. 
 
[tomcat]                                                                                                                                 

ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com        ansible_user=ubuntu                                                                                                 
ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com          ansible_user=ec2-user                                                                                               

#Update below default values with your Tomcat host
[tomcat:vars]
TomcatManagerIP=localhost                                                                                                               
Tomcat_Port=8080                                                                                                                         
Tomcat_User=admin                                                                                                                       
Tomcat_Pwd=admin    

Currently this script will handle following modules.

Tomcat,MySQL,Apache,Nginx,Redis,MongoDB.Check the inventory file to configure the modules.                                                                                                                    

# Step 3

once you update the inventory with your values then execute the setup.sh script which is available in telegraf directory.

sh setup.sh

If the script executed successfully , telegraf will send the configured modules data to influxDB (http://influxdb:8086).

# Step 4

Open the influxDB UI (http://influxdb:8083) and validate the data with below queries.

SHOW DATABASES                                                                                                                           
SHOW MEASUREMENTS                                                                                                                       
SHOW TAG KEYS FROM "measurement_name"                                                                                                   
SHOW TAG VALUES FROM "measurement_name" WITH KEY = "tag_key"                                                                            

Access Grafana UI (http://grafana:3000) and validate the datasources and dashboards.

