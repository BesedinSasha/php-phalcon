FROM debian:jessie

MAINTAINER Sasha Besedin <sasha.besedin@gmail.com>

RUN apt-get update -q ;\
    apt-get upgrade -y -q ;\
    apt-get dist-upgrade -y -q

RUN apt-get install -y -q sudo php5-dev php5-mcrypt php5-curl php5-mysql php5-sqlite php5-memcached php5-imagick php5-gd php5-intl php5-cli gcc git libpcre3-dev re2c

RUN git clone http://github.com/phalcon/zephir.git /usr/local/src/zephir ;\
    chmod +x /usr/local/src/zephir

RUN git clone http://github.com/Besedin86/cphalcon.git /usr/local/src/cphalcon
RUN cd /usr/local/src/cphalcon ;\
    git checkout 2.0.x ;\
    ../zephir install

RUN echo "extension=phalcon.so" > /etc/php5/mods-available/phalcon.ini ;\
    php5enmod phalcon

RUN apt-get clean
