export GRIDAPPSD_INSTALL=/home/gridappsd/gridappsd_project

mkdir -p $GRIDAPPSD_INSTALL

mkdir -p $GRIDAPPSD_INSTALL/sources

mkdir -p $GRIDAPPSD_INSTALL/builds

export GLD_INSTALL=$GRIDAPPSD_INSTALL/builds
export FNCS_INSTALL=$GRIDAPPSD_INSTALL/builds

#----------------
# gridlab-d setup pt1
#----------------
cd $GRIDAPPSD_INSTALL/sources
git clone https://github.com/gridlab-d/gridlab-d.git -b release/RC4.0 --single-branch






