#!/bin/bash

set -x
export XAUTHORITY=/home/oracle/.Xauthority

.  /opt/microfocus/VisualCOBOL/bin/cobsetenv

export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export ORACLE_SID=orcl1
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH:/usr/lib64:/usr/lib
export PATH=$ORACLE_HOME/bin:$PATH
export COBMODE=64

echo $ORACLE_HOME
echo $ORACLE_SID
echo $PATH
echo $LD_LIBRARY_PATH
echo $COBDIR 
echo $COBMODE