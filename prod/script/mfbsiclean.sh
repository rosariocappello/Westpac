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

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP
 

if [[ -z $2 ]];
then 
    ES_SERVER=$ES_DEF_SERVER
else
    ES_SERVER=$2
fi
export ES_SERVER

if [[ -z $3 ]];
then 
    logfile=$ENVTOP/System/mfbsi/$ES_SERVER/$PROGNAME.log
else
    logfile=$ENVTOP/System/mfbsi/$ES_SERVER/$3
fi
export logfile
rm -f $logfile

if [[ -z $4 ]];
then 
   MF_RUN_OPT=$4
   if [ $MF_RUN_OPT = 'RESTART' ]; then
      MF_RESTART_OPTION=$5  
   else
      MF_RESTART_OPTION=$5
   fi
else
    MF_RUN_OPT=$4
    MF_RESTART_OPTION=$5
fi

export MF_RUN_OPT
export MF_RESTART_OPTION
export 
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "PROGNAME      = " $PROGNAME.jcl        >>$logfile
echo  "MF_RUN_OPT    = " $MF_RUN_OPT          >>$logfile
echo  "LOGNAME       = " $LOGNAME             >>$logfile
echo  "HOSTNAME      = " $HOSTNAME            >>$logfile

ES_EMP_EXIT_1=mfbsiemx
export ES_EMP_EXIT_1
echo  "ES_EMP_EXIT_1 = " $ES_EMP_EXIT_1       >>$logfile

MFBSI_DIR=$ENVTOP/System/mfbsi/$ES_SERVER
export MFBSI_DIR
echo  "MFBSI_DIR     = " $MFBSI_DIR           >>$logfile

MFBSI_CFG=$ENVTOP/System/mfbsi/mfbsi.cfg
export MFBSI_CFG
echo  "MFBSI_CFG     = " $MFBSI_CFG           >>$logfile
MFBSISEC_DIR=$ENVTOP/System/mfbsi
export MFBSISEC_DIR
echo  "MMFBSISEC_DIR  = " $MFBSISEC_DIR    >>$logfile

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ENVTOP/System/mfbsiload
export LD_LIBRARY_PATH
echo  "LD_LIBRARY_PATH  = " $LD_LIBRARY_PATH   >>$logfile
# Current version of JCL source

MFBSIDEBUG="Y"
export MFBSIDEBUG

rm -f /opt/MLC/mfbsitrace.log
rm -f $MFBSISEC_DIR/mfbsisec.txt

SRCDIR=$ENVTOP/jcl
export SRCDIR
echo  "SRCDIR        = " $SRCDIR              >>$logfile

echo "****"                                   >>$logfile
mfbsijcl /Show                                >>$logfile

mfbsijcl mfbsijcl /clean date=20230501        >>$logfile

echo "****"                                   >>$logfile
cat $logfile
exit $rc