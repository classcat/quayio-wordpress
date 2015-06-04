#!/bin/bash

########################################################################
# ClassCat/WordPress Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY 2----------------------------------------------------------
# 04-jun-15 : call cc-initdb.sh finally.
# 04-jun-15 : delay initialializing /var/www/html to map volume.
# 04-jun-15 : key & salt.
# 04-jun-15 : created.
#-----------------------------------------------------------------------


######################
### INITIALIZATION ###
######################

function init () {
  echo "ClassCat Info >> initialization code for ClassCat/WordPress"
  echo "Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved."
  echo ""
}


############
### SSHD ###
############

function change_root_password() {
  if [ -z "${ROOT_PASSWORD}" ]; then
    echo "ClassCat Warning >> No ROOT_PASSWORD specified."
  else
    echo -e "root:${ROOT_PASSWORD}" | chpasswd
    # echo -e "${password}\n${password}" | passwd root
  fi
}


function put_public_key() {
  if [ -z "$SSH_PUBLIC_KEY" ]; then
    echo "ClassCat Warning >> No SSH_PUBLIC_KEY specified."
  else
    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    echo "${SSH_PUBLIC_KEY}" > /root/.ssh/authorized_keys
  fi
}


#############
### MYSQL ###
#############

function save_env_for_config_mysql () {
  # echo $MYSQL_ROOT_PASSWORD > /root/mysqlpass
  echo "export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" > /opt/env.sh

  #mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE DATABASE webmail"
  #mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "GRANT ALL PRIVILEGES ON webmail.* TO webmail@'%' IDENTIFIED BY 'ClassCatWebmail'";

  #mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql webmail < /usr/local/roundcubemail-1.1.1/SQL/mysql.initial.sql
}


#################
### WORDPRESS ###
#################

# Dockerfile has unzipped wordpress-4.2.2-ja.zip onto /usr/local/wordpress,
# and wp-config.php onto /opt/etc.
function init2 () {
  # mv /var/www/html /var/www/html.orig
  cp -a /usr/local/wordpress /var/www/html
  chown root.root -R /var/www/html

  cp -p /opt/etc/wp-config.php /var/www/html/wp-config.php  
}


function set_wp_config_php () {
  local config_file="/var/www/html/wp-config.php"

  local random1=`pwgen -s 64 1`
  local random2=`pwgen -s 64 1`
  local random3=`pwgen -s 64 1`
  local random4=`pwgen -s 64 1`
  local random5=`pwgen -s 64 1`
  local random6=`pwgen -s 64 1`
  local random7=`pwgen -s 64 1`
  local random8=`pwgen -s 64 1`

  sed -i.bak -e s/^define\(\'AUTH_KEY\',\s*.*\)\;$/define\(\'AUTH_KEY\',\'${random1}\'\)\;/               $config_file

  sed -i     -e s/^define\(\'SECURE_AUTH_KEY\',\s*.*\)\;$/define\(\'SECURE_AUTH_KEY\',\'${random2}\'\)\;/ $config_file

  sed -i     -e s/^define\(\'LOGGED_IN_KEY\',\s*.*\)\;$/define\(\'LOGGED_IN_KEY\',\'${random3}\'\)\;/     $config_file

  sed -i     -e s/^define\(\'NONCE_KEY\',\s*.*\)\;$/define\(\'NONCE_KEY\',\'${random4}\'\)\;/             $config_file

  sed -i     -e s/^define\(\'AUTH_SALT\',\s*.*\)\;$/define\(\'AUTH_SALT\',\'${random5}\'\)\;/             $config_file

  sed -i     -e s/^define\(\'SECURE_AUTH_SALT\',\s*.*\)\;$/define\(\'SECURE_AUTH_SALT\',\'${random6}\'\)\;/ $config_file

  sed -i     -e s/^define\(\'LOGGED_IN_SALT\',\s*.*\)\;$/define\(\'LOGGED_IN_SALT\',\'${random7}\'\)\;/   $config_file

  sed -i     -e s/^define\(\'NONCE_SALT\',\s*.*\)\;$/define\(\'NONCE_SALT\',\'${random8}\'\)\;/           $config_file
}


##################
### SUPERVISOR ###
##################
# See http://docs.docker.com/articles/using_supervisord/

function proc_supervisor () {
  cat > /etc/supervisor/conf.d/supervisord.conf <<EOF
[program:ssh]
command=/usr/sbin/sshd -D

[program:apache2]
command=/usr/sbin/apache2ctl -D FOREGROUND

[program:rsyslog]
command=/usr/sbin/rsyslogd -n
EOF
}


### ENTRY POINT ###

init 
change_root_password
put_public_key
save_env_for_config_mysql
init2
set_wp_config_php
proc_supervisor

# initialize database.
/opt/bin/cc-initdb.sh

exit 0


### End of Script ###
