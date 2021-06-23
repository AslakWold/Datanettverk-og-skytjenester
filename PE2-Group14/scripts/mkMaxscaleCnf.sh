#! /bin/bash

source dats14-params.sh

echo "# Globals 
[maxscale] 

# Servers 
[$DB1_NAME] 
type = server 
address = $DB1_HOSTNAME 
port = 3306 
protocol = MariaDBBackend 

[$DB2_NAME] 
type = server 
address = $DB2_HOSTNAME 
port = 3306 
protocol = MariaDBBackend

[$DB3_NAME] 
type = server 
address = $DB3_HOSTNAME 
port = 3306 
protocol = MariaDBBackend

# Monitoring for the servers 
[MariaDB-Monitor] 
type = monitor 
module = galeramon 
servers = $DB1_NAME,$DB2_NAME,$DB3_NAME 
user = $MAXSCALE_USER 
password = $MAXSCALE_PASS 
monitor_interval = 2000 
disable_master_failback = 1 

# Galera router service 
[Read-Write-Service] 
type = service 
router = readwritesplit 
servers = $DB1_NAME,$DB2_NAME,$DB3_NAME 
user = $MAXSCALE_USER 
password = $MAXSCALE_PASS 
slave_selection_criteria = LEAST_GLOBAL_CONNECTIONS 
master_failure_mode = error_on_write 
max_slave_connections = 1 
enable_root_user = true 

# Galera listener 
[Read-Write-Listener] 
type = listener 
service = Read-Write-Service 
protocol = MariaDBClient 
port = 3306 
address = 0.0.0.0" > ~/volumes/$MAXSCALE_NAME/maxscale.cnf
