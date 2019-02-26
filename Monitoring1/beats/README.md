# Beats

This Directory contains files to install ansible and trigger the ansible playbook to install and configure Beats in different distributions of linux (Redhat,Ubuntu).

## How to use 
## Prerequisites
Linux VMs (Currently supported Redhat,Debian) which needs to be monitored.
ElasticSearch
Kibana 

# Step 1
Download the zip file and unzip the file.

  unzip beats.zip                                                                                                                     
  cd beats/ 

 # Step 2a
 Before using this script you have to update the inventory file with your values. 

Sample inventory file is available in beats directory.
 
 Given Below example performs installation of beats and configure on two hosts.

 If you are using different username and password for every host you have to define the values individually. 
 
 [hosts]                                                                                                                                 
 ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com        ansible_user=ubuntu                                                        
 ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com          ansible_user=ec2-user                                                                                               

If you are using same username and password or key for all hosts you can define those values like below.

[hosts:vars]                                                                                                                             

ansible_ssh_private_key_file=/home/ec2-user/monitoring.pem                                                                               
ansible_connection=ssh                                                                                                                   
ansible_user=ec2-user                                                                                                             
ansible_password=ec2-user                                                   

# Step 2b
#update the Elasticsearch URL to store the data.                                                                                        
elasticsearch_url=http://elasticsearch:9200                                                                                          
elasticsearch_username=elastic                                                                                
elasticsearch_password=changeme                                                        
                                                                                        
#update the Kibana URL to visualize the data.                                                                                           
kibana_url=http://kibana:5601                                                                                                     
kibana_username=elastic                                                                                      
kibana_password=changeme           

# Step 2c
Asume VM1 has to be monitored with filebeat.
#To Configure filebeat,define your Target Machine ip's under filebeat block to enable and configure filebeat. define the related variables like below.
 
[filebeat]                                                                                                                               
ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com        ansible_user=ubuntu                                                  
ec2-50-112-xx-xx.us-west-2.compute.amazonaws.com           ansible_user=ec2-user                                                                                               
                                                                                                                              
[filebeat:vars]                                                                                                                         
filebeat_apache2_enable=true                                                                                                            
filebeat_apache2_access_logpath=/var/log/apache2/access.log*                                                                            
filebeat_apache2_error_logpath=/var/log/apache2/error.log*                                                                               
filebeat_system_enable=true                                                                                                             
filebeat_system_syslogpath=/var/log/host/system.log*                                                                                    
filebeat_mysql_enable=true                                                                                                               
filebeat_mysql_error_logpath=/var/log/mysql/error.log*                                                                                  
filebeat_mysql_slowlog_logpath=/var/log/mysql/mysql-slow.log*                                                                           
filebeat_nginx_enable=true                                                                                                              
filebeat_nginx_access_logpath=/var/log/nginx/access.log*                                                                                 
filebeat_nginx_error_logpath=/var/log/nginx/error.log*  
filebeat_dashboard_import=true                                                               

# Step 3
once you update the inventory with your values then execute the setup.sh script which is available in beats directory.

sh setup.sh

#Step 4

If the script executed successfully ,filebeat indexes will be created in elasticsearch.You can verify the created index patterns in kibana.

http://kibana:5601                        

Management--Index Patterns
