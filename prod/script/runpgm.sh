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

LOGDIR=$ENVTOP/logs
export LOGDIR

rm -f $LOGDIR/$PROGNAME_Stack*
rm -f $LOGDIR/$PROGNAME_Core*
rm -f $ENVTOP/ctf/*
rm -f $ENVTOP/testcover/*
rm -f $ENVTOP/profiler/*

logfile=$ENVTOP/logs/$PROGNAME.log
export logfile
rm -f   $logfile

COBIDY=$ENVTOP/bin
export COBIDY

BINLOC=$ENVTOP/bin
export BINLOC
 
rem COBCONFIG=$ENVTOP/cfg/cobconfig
rem export COBCONFIG
 
export COBPRFDIR=$MFPPFLOC
export COBPRFDIR

export TESTCOVER=$ENVTOP/cfg/$PROGNAME.tcf 
export TESTCOVER

export MFTRACE_CONFIG=$ENVTOP/cfg/ctf.cfg 
export MFTRACE_CONFIG

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
echo  "TESTCOVER     = " $TESTCOVER           >>$logfile
echo  "MFTRACE_CONFIG= " $MFTRACE_CONFIG      >>$logfile
echo  "COBCONFIG     = " $COBCONFIG           >>$logfile

echo " "                                      >>$logfile
if [[ -f $ENVTOP/cfg/$PROGNAME.tcf ]]; then
    echo "tcf file $ENVTOP/cfg/$PROGNAME.tcf "               >>$logfile
else
    echo "Create tcf file $$ENVTOP/cfg/$PROGNAME.tcf "       >>$logfile
    echo "[TESTCOVER]"                                       >$ENVTOP/cfg/$PROGNAME.tcf 
    echo "RESULT $ENVTOP/testcover/$PROGNAME.tcz"            >>$ENVTOP/cfg/$PROGNAME.tcf 
    echo "ECHO NO"                                           >>$ENVTOP/cfg/$PROGNAME.tcf 
    echo "LOGNAME $ENVTOP/testcover/testcover_$PROGNAME.log" >>$ENVTOP/cfg/$PROGNAME.tcf 
fi

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile

cat  $ENVTOP/cfg/$PROGNAME.tcf                               >>$logfile

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile

rem cat $COBCONFIG                                                 >>$logfile

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile
            
echo  "$BINLOC/$1.so "                                          >>$logfile
rtsora $BINLOC/$1.so
rc=$?
echo "$PROGNAME.so compiled with a return code of $rc "         >>$logfile 
cat $logfile
exit $rc