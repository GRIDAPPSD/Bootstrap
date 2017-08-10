export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

BOOTSTRAP_HOME=`pwd`

#----------------
# mysql setup
#---------------- 
mysql -u root -pgridappsd1234 < /tmp/gridappsd_mysql_dump.sql

mkdir -p $GRIDAPPSD_INSTALL

mkdir -p $GRIDAPPSD_INSTALL/sources

mkdir -p $GRIDAPPSD_INSTALL/builds
#TODO remove need for this directory (currently used by fncs_goss_bridge, it should go elsewhere)
mkdir -p /home/gridappsd/var/log
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
# goss gridapps-d viz setup
#----------------
cd $GRIDAPPSD_INSTALL/sources
git clone https://github.com/GRIDAPPSD/viz.git
cd viz
npm install
webpack


#----------------
# goss gridapps-d blazegraph setup
#----------------
wget https://downloads.sourceforge.net/project/bigdata/bigdata/2.1.1/blazegraph.jar -O $GRIDAPPSD_INSTALL/builds/lib/blazegraph.jar
sleep 2
java -Dbigdata.propertyFile=$GRIDAPPSD_INSTALL/builds/lib/conf/rwstore.properties -jar $GRIDAPPSD_INSTALL/builds/lib/blazegraph.jar >> $GRIDAPPSD_INSTALL/builds/log/blazegraph.log 2>&1 &
BGPID=`echo $!`
curl -X POST --data-binary @/tmp/bg_dataloader.xml --header 'Content-Type:application/xml' http://localhost:9999/bigdata/dataloader
kill $BGPID


