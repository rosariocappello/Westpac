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

logfile=$ENVTOP/logs/$PROGNAME_profile.log
export logfile

COBIDY=$ENVTOP/bin
export COBIDY

rm -f   $logfile
rm  -f  $MFPPFLOC/$1.prf  

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

cd $MFPPFLOC 

echo "cobprof $MFPPFLOC/$1.ipf +LIST +ALL"      >>$logfile
cobprof $MFPPFLOC/$1.ipf +LIST +ALL

echo "****"                                   >>$logfile
cat  $MFPPFLOC/$1.prf                         >>$logfile
echo "****"                                   >>$logfile

cat $logfile
exit $rc