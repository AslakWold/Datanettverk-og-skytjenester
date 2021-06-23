#! /bin/bash

source dats14-params.sh

echo "[mysqld]

bind-address			= 0.0.0.0
default_storage_engine		= InnoDB
binlog_format			= ROW

wsrep_on			= ON
wsrep_provider			= /usr/lib/galera/libgalera_smm.so
wsrep_sst_method		= rsync" > ~/volumes/$DB1_NAME/conf.d/my.cnf

echo "[mysqld]

bind-address			= 0.0.0.0
default_storage_engine		= InnoDB
binlog_format			= ROW

wsrep_on			= ON
wsrep_provider			= /usr/lib/galera/libgalera_smm.so
wsrep_sst_method		= rsync" > ~/volumes/$DB2_NAME/conf.d/my.cnf

echo "[mysqld]

bind-address			= 0.0.0.0
default_storage_engine		= InnoDB
binlog_format			= ROW

wsrep_on			= ON
wsrep_provider			= /usr/lib/galera/libgalera_smm.so
wsrep_sst_method		= rsync" > ~/volumes/$DB3_NAME/conf.d/my.cnf