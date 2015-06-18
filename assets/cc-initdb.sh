#!/bin/bash

########################################################################
# ClassCat/WordPress Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY -----------------------------------------------------------
# 18-jun-15 : skip config.
# 05-may-15 : wait for mysql running.
# 29-may-15 : Created.
#-----------------------------------------------------------------------

. /opt/env.sh

######################
### INITIALIZATION ###
######################

function init () {
  echo "ClassCat Info >> initialization database for ClassCat/WordPress"
  echo "Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved."
  echo ""
}


#############
### MYSQL ###
#############

function config_mysql () {
  RET=1
  while [[ RET -ne 0 ]]; do
    sleep 5
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE DATABASE wordpress"
    RET=$?
  done

  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@'%' IDENTIFIED BY 'ClassCatWordpress'";
}


### ENTRY POINT ###

init 
if [ -e /opt/cc-initdb_done ]; then
  echo "ClassCat Warning >> /opt/cc-initdb_done found, then skip wp configuration."
else
  config_mysql
  touch /opt/cc-initdb_done
fi

exit 0


### End of Script ###
