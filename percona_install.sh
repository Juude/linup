#!/bin/bash
 
echo "+Adding Percona MySQL repositories..."
echo "" >> /etc/apt/sources.list
echo "deb http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list
apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
apt-get update
 
echo "+Set apt-get preferences for Percona MySQL packages..."
cat >/etc/apt/preferences.d/00percona.pref << "EOF"
Package: *
Pin: release o=Percona Development Team
Pin-Priority: 1001
EOF
 
echo "+Installing Percona MySQL package..."
apt-get install -q -y percona-server-server-5.6 percona-server-client-5.6
 
echo "+Installing php-mysqlnd module..."
apt-get install -q -y php5-mysqlnd
