export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

mkdir -p $GRIDAPPSD_INSTALL

mkdir -p $GRIDAPPSD_INSTALL/sources

mkdir -p $GRIDAPPSD_INSTALL/builds

#----------------
# goss gridapps-d setup
#----------------
cd $GRIDAPPSD_INSTALL/sources

git clone https://github.com/GRIDAPPSD/GOSS-GridAPPS-D.git
cd GOSS-GridAPPS-D
chmod a+x build-goss-test.sh
chmod a+x run-goss-test.sh
./build-goss-test.sh
mkdir -p $GRIDAPPSD_INSTALL/builds/log

#----------------
# mysql setup
#---------------- 
mysql -u root -pgridappsd1234 < /tmp/gridappsd_mysql_dump.sql


#----------------
# goss gridapps-d setup
#----------------
cd $GRIDAPPSD_INSTALL/sources
git clone https://github.com/GRIDAPPSD/viz.git
cd viz
npm install


