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
 
MFTESTLOC=$ENVTOP/testcover
export MFTESTLOC

logfile=$ENVTOP/logs/$PROGNAME_testcover.log
export logfile

COBIDY=$ENVTOP/bin
export COBIDY

rm -f   $logfile

echo "****"                                   >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "PROGNAME      = " $PROGNAME            >>$logfile
echo  "LOGNAME       = " $LOGNAME             >>$logfile
echo  "HOSTNAME      = " $HOSTNAME            >>$logfile
echo  "MFTESTLOC     = " $MFTESTLOC           >>$logfile
echo  "COBIDY        = " $COBIDY              >>$logfile

cd $MFTESTLOC

echo "cobtcreport $PROGNAME.tcz calls"       >>$logfile
cobtcreport $PROGNAME.tcz calls

cat $logfile
exit $rc