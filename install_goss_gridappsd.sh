export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

BOOTSTRAP_HOME=`pwd`

#----------------
# mysql setup
#---------------- 
mysql -u root -pgridappsd1234 < $BOOTSTRAP_HOME/gridappsd_mysql_dump.sql

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
mkdir -p $GRIDAPPSD_INSTALL/builds/lib/conf
cp $BOOTSTRAP_HOME/conf/* $GRIDAPPSD_INSTALL/builds/lib/conf




#----------------
# goss gridapps-d setup
#----------------
cd $GRIDAPPSD_INSTALL/sources
git clone https://github.com/GRIDAPPSD/viz.git
cd viz
npm install
webpack

wget https://downloads.sourceforge.net/project/bigdata/bigdata/2.1.1/blazegraph.jar -O $GRIDAPPSD_INSTALL/builds/lib/blazegraph.jar
