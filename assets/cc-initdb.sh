#!/bin/bash

########################################################################
# ClassCat/WordPress Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY -----------------------------------------------------------
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
  echo $MYSQL_ROOT_PASSWORD > /root/debug

  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE DATABASE wordpress"
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@'%' IDENTIFIED BY 'ClassCatWordpress'";

#  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql webmail < /usr/local/roundcubemail-1.1.1/SQL/mysql.initial.sql
}


### ENTRY POINT ###

init 
config_mysql

exit 0


### End of Script ###
