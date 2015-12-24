FROM debian:jessie

MAINTAINER Sasha Besedin <sasha.besedin@gmail.com>

RUN apt-get update -q ;\
    apt-get upgrade -y -q ;\
    apt-get dist-upgrade -y -q

RUN apt-get install -y -q php5-dev php5-mcrypt php5-curl php5-pgsql php5-mysql php5-sqlite php5-memcached php5-imagick php5-gd php5-intl php5-cli gcc git libpcre3-dev

RUN git clone --depth=1 git://github.com/phalcon/cphalcon.git /usr/local/src/cphalcon
RUN cd /usr/local/src/cphalcon/ext && ./install ;\
    echo "extension=phalcon.so" > /etc/php5/mods-available/phalcon.ini ;\
    php5enmod phalcon

RUN apt-get clean
