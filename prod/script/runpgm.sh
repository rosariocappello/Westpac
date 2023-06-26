#!/bin/bash
#  
#
# Modification History
# --------------------
# 04-Oct-2022   Rosario Cappello    Original version

.  setenv_global.sh

if [ $MF_DEBUG_OPTION  = 'Y' ]; then
  set -x
fi

PROGNAME=$(basename $1 .so)
export PROGNAME

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP
 
MFPPFLOC=$ENVTOP/profiler
export MFPPFLOC

logfile=$ENVTOP/logs/$PROGNAME.log
export logfile

COBIDY=$ENVTOP/bin
export COBIDY

BINLOC=$ENVTOP/bin
export LOCLOC

export COBCONFIG=$HOME/$ENVTOP/cfg/cobconfig

export COBPRFDIR=$MFPPFLOC

if [[ -f $ENVTOP/cfg/$PROGNAME.tcf ]]; then
    echo "Dir file $ENVTOP/cfg/$PROGNAME.tcf "               >>$logfile

else
    echo "Create tcf file $$ENVTOP/cfg/$PROGNAME.tcf "       >>$logfile
    echo "[TESTCOVER]"                                       >$ENVTOP/cfg/$PROGNAME.tcf 
    echo "RESULT $ENVTOP/testcover/$PROGNAME.tcz"            >>$ENVTOP/cfg/$PROGNAME.tcf 
    echo "ECHO NO"                                           >>$ENVTOP/cfg/$PROGNAME.tcf 
    echo "LOGNAME $ENVTOP/testcover/testcover_$PROGNAME.log" >>$ENVTOP/cfg/$PROGNAME.tcf 
fi

cat ENVTOP/cfg/$PROGNAME.tcf                                 >>$logfile
export TESTCOVER=$ENVTOP/cfg/$PROGNAME.tcf 

rm -f   $logfile

echo "****"                                   >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "PROGNAME      = " $PROGNAME            >>$logfile
echo  "LOGNAME       = " $LOGNAME             >>$logfile
echo  "HOSTNAME      = " $HOSTNAME            >>$logfile
echo  "MFPPFLOC      = " $MFPPFLOC            >>$logfile
echo  "COBIDY        = " $COBIDY              >>$logfile

echo  "$BINLOC/$1.so "                        >>$logfile
rtsora $BINLOC/$1.so

cat $logfile
exit $rc