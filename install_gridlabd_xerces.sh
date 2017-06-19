export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

mkdir -p $GRIDAPPSD_INSTALL

mkdir -p $GRIDAPPSD_INSTALL/sources

mkdir -p $GRIDAPPSD_INSTALL/builds

export GLD_INSTALL=$GRIDAPPSD_INSTALL/builds
export FNCS_INSTALL=$GRIDAPPSD_INSTALL/builds

#----------------
# xerces setup
#----------------
cd $GRIDAPPSD_INSTALL/sources/gridlab-d/third_party
tar -xzf xerces-c-3.1.1.tar.gz
cd xerces-c-3.1.1
./configure
make
make install
