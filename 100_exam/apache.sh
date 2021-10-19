#!/bin/bash
mkdir /web
cd /web
yum install -y wget expat-devel gcc gcc-c++
wget https://downloads.apache.org/apr/apr-1.7.0.tar.gz
wget https://downloads.apache.org/apr/apr-util-1.6.1.tar.gz
wget https://downloads.apache.org/httpd/httpd-2.4.51.tar.gz
wget https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz --no-check-certificate
tar xvfz apr-1.7.0.tar.gz
tar xvfz apr-util-1.6.1.tar.gz
tar xvfz httpd-2.4.51.tar.gz
tar xvfz pcre-8.45.tar.gz
cd apr-1.7.0 ; ./configure --prefix=/web/apr ; make && make install
cd ../apr-util-1.6.1 ; ./configure --prefix=/web/aprutil --with-apr=/web/apr ; make && make install
cd ../pcre-8.45 ; ./configure --prefix=/web/pcre ; make && make install
cd ../httpd-2.4.51 ; ./configure --prefix=/usr/local/apache2 --with-apr=/web/apr --with-apr-util=/web/aprutil --with-pcre=/web/pcre ; make && make install
echo "export APACHE=/usr/local/apache2" >> /etc/profile
echo "export PATH=\$APACHE/bin:\$PATH" >> /etc/profile
source /etc/profile
apachectl start
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload