FROM centos/s2i-base-centos7

# This image provides an Apache+PHP environment for running PHP
# applications.
USER 0

EXPOSE 8080
EXPOSE 8443

# Description
# This image provides an Apache 2.4 + PHP 7.1 environment for running PHP applications.
# Exposed ports:
# * 8080 - alternative port for http

ENV PHP_VERSION=7.1 \
    PHP_VER_SHORT=71 \
    NAME=php \
    PATH=$PATH:/opt/rh/rh-php71/root/usr/bin

RUN yum -y install cronie
RUN systemctl restart crond.service

RUN cat /etc/crontab

USER 1001

# Set the default CMD to print the usage of the language image
CMD $STI_SCRIPTS_PATH/usage