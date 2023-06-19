#!/bin/bash
# *********************************************
# MLC command file
# *********************************************
#
# V00  - Initial Version           Rc Nov '22'
#
# *********************************************

# Create Enterprise Developer COBOL Environment

.  setenv_global.sh

if [ $MF_DEBUG_OPTION  = 'Y' ]; then
  set -x
fi

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP

if [[ -z $1 ]];
then 
    ES_SERVER=$ES_DEF_SERVER
else
    ES_SERVER=$1
fi
export ES_SERVER

COBIDY=$ENVTOP/System/loadlib
export COBIDY

MFprofloc=$ENVTOP/System/Profile
export MFprofloc

logfile=$ENVTOP/logs/MFprofloc_region.log
export MFprofloc

rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "Profile LOC   = " $MFprofloc           >>$logfile 
echo  "COBIDY        = " $COBIDY              >>$logfile
 
cd $MFprofloc  

ls *.ipf > $MFprofloc/profile_list


exec 5< profile_list
   for i in `ls *.ipf`
   do
      echo                          >>$logfile
      echo "Profile for program $i" >>$logfile
      echo                          >>$logfile
      export PROGNAME=$(basename $i .ipf)
      echo "cobprof $PROGNAME.ipf   +all  +verbose "   >>$logfile    
      cobprof $PROGNAME.ipf   +all  +verbose   
      echo                          >>$logfile        
      echo "****"                   >>$logfile
      cat $PROGNAME.prf             >>$logfile
done
cat $logfile

rm -f $MFprofloc/profile_list
	
exit