#prereq should have a user called gridappsd that everthing is expected to run under

#bootstrap - launch this script as root   


#----------------
# prereq setup
#----------------
apt update -y 

apt install -y vim git automake default-jdk g++ gcc python python-pip libtool apache2 gradle nodejs-legacy npm

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password gridappsd1234'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password gridappsd1234'
apt install -y mysql-server

pip install --upgrade pip
pip install stomp.py

npm install -g express
npm install -g ejs
npm install -g typescript
npm install -g typings



export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

