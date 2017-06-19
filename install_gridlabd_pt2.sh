export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

mkdir -p $GRIDAPPSD_INSTALL

mkdir -p $GRIDAPPSD_INSTALL/sources

mkdir -p $GRIDAPPSD_INSTALL/builds

export GLD_INSTALL=$GRIDAPPSD_INSTALL/builds
export FNCS_INSTALL=$GRIDAPPSD_INSTALL/builds

#----------------
# gridlab-d setup pt2
#----------------
cd $GRIDAPPSD_INSTALL/sources/gridlab-d
autoreconf -if
./configure --prefix=$GLD_INSTALL --with-fncs=$FNCS_INSTALL --enable-silent-rules 'CFLAGS=-g -O0 -w' 'CXXFLAGS=-g -O0 -w' 'LDFLAGS=-g -O0 -w'
make
make install

export PATH=$PATH:$GLD_INSTALL/bin 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FNCS_INSTALL/lib
export GLPATH=$GLD_INSTALL/lib/gridlabd:$GLD_INSTALL/share/gridlabd
export CXXFLAGS=$CXXFLAGS:$GLD_INSTALL/share/gridlabd 
