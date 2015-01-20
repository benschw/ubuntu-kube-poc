FROM ubuntu:14.04

MAINTAINER Ben Schwartz, https://github.com/benschw

RUN apt-get update

#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 libapache2-mod-php5 php5-mysql php5-gd php-pear php-apc php5-curl curl lynx-cur

# install apache & php
RUN apt-get install -y apache2 php5

RUN a2enmod php5
RUN a2enmod rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid


EXPOSE 80

ADD ./httpdocs /var/www/html

#ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf



# Launch apache when launching the container

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
