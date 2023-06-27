#!/bin/bash

export PATH=$PATH:/home/oracle/Westpac/prod/script


.  setenv_global.sh

if [ $MF_DEBUG_OPTION  = 'Y' ]; then
  set -x
fi

if [[ -z $1 ]];
then 
    ES_SERVER=$ES_DEF_SERVER
else
    ES_SERVER=$1
fi
export ES_SERVER

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP

logfile=$ENVTOP/logs/mfcomp_bulk_log
export logfile
rm -f $logfile

COBLISTDIR=$ENVTOP/logs/cobol_prog_list
export COBLISTDIR
rm -f $COBLISTDIR

logstat=$ENVTOP/logs/mfcomp_bulk_Status_log
export logstat
rm -f $logstat

logfailed=$ENVTOP/logs/mfcomp_bulk_failed_log
export logfailed
rm -f $logfailed

mfrebld=$ENVTOP/script/mfrebuildMF.sh
export mfrebld
rm -f $mfrebld

rm -f $ENVTOP/listing/*
rm -f $ENVTOP/bin/*
rm -f $ENVTOP/logs/*
rm -f $ENVTOP/dbrm/*
rm -f $ENVTOP/failedbuild/*
rm -f $ENVTOP/cobol/*.o

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   

echo .                                        >> $logfailed

export SAVEPATH=$PATH

cd $ENVTOP/cobol/

ls *.cob > $COBLISTDIR

cat $COBLISTDIR                     >>  $logfile

exec 5< $COBLISTDIR
   for i in `ls *.cob`
   do
      echo                           >>  $logfile
      echo "Compiling program $i"    >>  $logfile
      echo                           >>  $logfile
      export PROGNAME=$(basename $i .cob)

      . $ENVTOP/script/mfcobdb2.sh $i $SAVEPATH $PROGNAME.log Y
      return_code=$?

      echo " cob command compilation for " $i " = " $return_code  >>  $logstat
      echo " cob command compilation for " $i " = " $return_code  >>  $logfile
      
      if [ $return_code -ne 0 ]
       then
         echo                                                       >>  $logfile
         echo " cob command failed in compilation script for "  $i  >>  $logfailed
         echo "./mfcobdb2.sh" $i                                    >>  $mfrebld
         export PROGNAME=$(basename $i .cob)

         cp   $ENVTOP/listing/$PROGNAME.lst            $ENVTOP/failedbuild/$PROGNAME.lst
         cat  $ENVTOP/logs/$PROGNAME.log           >>  $logfile
         echo                                      >>  $logfile
#        exit $rt_pdf
       fi

   done

 mv $ENVTOP/cobol/mfcomp_bulk_Status_log   $logstat
 mv $ENVTOP/cobol/mfcomp_bulk_failed_log   $logfailed

 cat  $logstat
 cat  $logfailed

# done
exec 5<&- 

rm -f $COBLISTDIR

#exit