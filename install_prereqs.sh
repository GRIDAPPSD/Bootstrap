#prereq should have a user called gridappsd that everthing is expected to run under

#bootstrap - launch this script as root   


#----------------
# prereq setup
#----------------
apt update -y 

apt install -y vim git automake default-jdk g++ gcc python python-pip libtool apache2 gradle nodejs-legacy npm curl

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password gridappsd1234'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password gridappsd1234'
apt install -y mysql-server

pip install --upgrade pip
pip install stomp.py
pip install pyyaml

npm install -g express
npm install -g ejs
npm install -g typescript
npm install -g typings
npm install -g webpack

cp ieee8500.xml /tmp
cp gridappsd_mysql_dump.sql /tmp
chmod a+r /tmp/*.xml
chmod a+r /tmp/*.sql

export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project


mkdir -p $GRIDAPPSD_INSTALL/builds/conf
cp -n conf/* $GRIDAPPSD_INSTALL/builds/conf
chown -R gridappsd:gridappsd $GRIDAPPSD_INSTALL
