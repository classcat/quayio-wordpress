FROM ubuntu:trusty
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/WordPress Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
# 04-jun-15 : ja, wp-config.ja.php
# 04-jun-15 : pwgen, wp-config.php
# 04-jun-15 : created.
#-----------------------------------------------------------------------

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y language-pack-en language-pack-en-base \
  && apt-get install -y language-pack-ja language-pack-ja-base \
  && update-locale LANG="en_US.UTF-8" \
  && apt-get install -y openssh-server supervisor rsyslog mysql-client \
       apache2 php5 php5-mysql php5-mcrypt php5-intl \
       php5-gd php5-json php5-curl php5-imagick libapache2-mod-php5 \
  && apt-get install -y curl pwgen unzip \
  && apt-get clean \
  && mkdir -p /var/run/sshd \
  && sed -i.bak -e "s/^PermitRootLogin\s*.*$/PermitRootLogin yes/" /etc/ssh/sshd_config \
  && php5enmod mcrypt \
  && sed -i.bak -e "s/^;date\.timezone =.*$/date\.timezone = 'Asia\/Tokyo'/" /etc/php5/apache2/php.ini \
  && sed -i     -e "s/^;default_charset =.*$/default_charset = \"UTF-8\"/"   /etc/php5/apache2/php.ini \
  && cd /usr/local \
  && wget https://ja.wordpress.org/wordpress-4.2.2-ja.zip \
  && unzip wordpress-4.2.2-ja.zip \
  && mv /var/www/html /var/www/html.orig \
  && cp -a wordpress /var/www/html \
  && chown root.root -R /var/www/html

# RUN sed -i -e 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

COPY assets/supervisord.conf /etc/supervisor/supervisord.conf

COPY assets/wp-config.ja.php /var/www/html/wp-config.php
#COPY assets/wp-config.php /var/www/html/wp-config.php

WORKDIR /opt
COPY assets/cc-init.sh   /opt/bin/cc-init.sh
COPY assets/cc-initdb.sh /opt/bin/cc-initdb.sh

EXPOSE 22 80

CMD /opt/bin/cc-init.sh; sleep 5; /opt/bin/cc-initdb.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
