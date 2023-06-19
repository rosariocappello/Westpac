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

logfile=$ENVTOP/logs/db2_load.log
export logfile

rm -f $logfile
  
             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
  
db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD >>$logfile

echo  '#** **'   >>$logfile
 
rm -f $IXFLOC/ADMINCNF.txt
echo db2 load from  $IXFLOC/ADMINCNF.ixf of ixf messages   $IXFLOC/ADMINCNF.txt replace into AGENT.ADMINCNF;  >>$logfile
     db2 load from  $IXFLOC/ADMINCNF.ixf of ixf messages   $IXFLOC/ADMINCNF.txt replace into AGENT.ADMINCNF; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADMINCNF.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADOSTAG2.txt
echo db2 load from  $IXFLOC/ADOSTAG2.ixf of ixf messages   $IXFLOC/ADOSTAG2.txt replace into CLIENT.ADOSTAG2;  >>$logfile
     db2 load from  $IXFLOC/ADOSTAG2.ixf of ixf messages   $IXFLOC/ADOSTAG2.txt replace into CLIENT.ADOSTAG2; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADOSTAG2.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADOSTAGE.txt
echo db2 load from  $IXFLOC/ADOSTAGE.ixf of ixf messages   $IXFLOC/ADOSTAGE.txt replace into CLIENT.ADOSTAGE;  >>$logfile
     db2 load from  $IXFLOC/ADOSTAGE.ixf of ixf messages   $IXFLOC/ADOSTAGE.txt replace into CLIENT.ADOSTAGE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADOSTAGE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVADCNF.txt
echo db2 load from  $IXFLOC/ADVADCNF.ixf of ixf messages   $IXFLOC/ADVADCNF.txt replace into AGENT.ADVADCNF;  >>$logfile
     db2 load from  $IXFLOC/ADVADCNF.ixf of ixf messages   $IXFLOC/ADVADCNF.txt replace into AGENT.ADVADCNF; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVADCNF.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVAPADM.txt
echo db2 load from  $IXFLOC/ADVAPADM.ixf of ixf messages   $IXFLOC/ADVAPADM.txt replace into AGENT.ADVAPADM;  >>$logfile
     db2 load from  $IXFLOC/ADVAPADM.ixf of ixf messages   $IXFLOC/ADVAPADM.txt replace into AGENT.ADVAPADM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVAPADM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVIMPLG.txt
echo db2 load from  $IXFLOC/ADVIMPLG.ixf of ixf messages   $IXFLOC/ADVIMPLG.txt replace into AGENT.ADVIMPLG;  >>$logfile
     db2 load from  $IXFLOC/ADVIMPLG.ixf of ixf messages   $IXFLOC/ADVIMPLG.txt replace into AGENT.ADVIMPLG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVIMPLG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_INDEX.txt
echo db2 load from  $IXFLOC/ADVISE_INDEX.ixf of ixf messages   $IXFLOC/ADVISE_INDEX.txt replace into DB2INST1.ADVISE_INDEX;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_INDEX.ixf of ixf messages   $IXFLOC/ADVISE_INDEX.txt replace into DB2INST1.ADVISE_INDEX; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_INDEX.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_INSTANCE.txt
echo db2 load from  $IXFLOC/ADVISE_INSTANCE.ixf of ixf messages   $IXFLOC/ADVISE_INSTANCE.txt replace into DB2INST1.ADVISE_INSTANCE;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_INSTANCE.ixf of ixf messages   $IXFLOC/ADVISE_INSTANCE.txt replace into DB2INST1.ADVISE_INSTANCE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_INSTANCE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_MQT.txt
echo db2 load from  $IXFLOC/ADVISE_MQT.ixf of ixf messages   $IXFLOC/ADVISE_MQT.txt replace into DB2INST1.ADVISE_MQT;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_MQT.ixf of ixf messages   $IXFLOC/ADVISE_MQT.txt replace into DB2INST1.ADVISE_MQT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_MQT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_PARTITION.txt
echo db2 load from  $IXFLOC/ADVISE_PARTITION.ixf of ixf messages   $IXFLOC/ADVISE_PARTITION.txt replace into DB2INST1.ADVISE_PARTITION;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_PARTITION.ixf of ixf messages   $IXFLOC/ADVISE_PARTITION.txt replace into DB2INST1.ADVISE_PARTITION; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_PARTITION.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_TABLE.txt
echo db2 load from  $IXFLOC/ADVISE_TABLE.ixf of ixf messages   $IXFLOC/ADVISE_TABLE.txt replace into DB2INST1.ADVISE_TABLE;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_TABLE.ixf of ixf messages   $IXFLOC/ADVISE_TABLE.txt replace into DB2INST1.ADVISE_TABLE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_TABLE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVISE_WORKLOAD.txt
echo db2 load from  $IXFLOC/ADVISE_WORKLOAD.ixf of ixf messages   $IXFLOC/ADVISE_WORKLOAD.txt replace into DB2INST1.ADVISE_WORKLOAD;  >>$logfile
     db2 load from  $IXFLOC/ADVISE_WORKLOAD.ixf of ixf messages   $IXFLOC/ADVISE_WORKLOAD.txt replace into DB2INST1.ADVISE_WORKLOAD; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_WORKLOAD.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVSTAG2.txt
echo db2 load from  $IXFLOC/ADVSTAG2.ixf of ixf messages   $IXFLOC/ADVSTAG2.txt replace into AGENT.ADVSTAG2;  >>$logfile
     db2 load from  $IXFLOC/ADVSTAG2.ixf of ixf messages   $IXFLOC/ADVSTAG2.txt replace into AGENT.ADVSTAG2; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVSTAG2.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/ADVS
TAGE.txt
echo db2 load from  $IXFLOC/ADVSTAGE.ixf of ixf messages   $IXFLOC/ADVSTAGE.txt replace into AGENT.ADVSTAGE;  >>$logfile
     db2 load from  $IXFLOC/ADVSTAGE.ixf of ixf messages   $IXFLOC/ADVSTAGE.txt replace into AGENT.ADVSTAGE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/ADVSTAGE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_ACTUALS.txt
echo db2 load from  $IXFLOC/EXPLAIN_ACTUALS.ixf of ixf messages   $IXFLOC/EXPLAIN_ACTUALS.txt replace into DB2INST1.EXPLAIN_ACTUALS;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_ACTUALS.ixf of ixf messages   $IXFLOC/EXPLAIN_ACTUALS.txt replace into DB2INST1.EXPLAIN_ACTUALS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ACTUALS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_ARGUMENT.txt
echo db2 load from  $IXFLOC/EXPLAIN_ARGUMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_ARGUMENT.txt replace into DB2TESTER.EXPLAIN_ARGUMENT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_ARGUMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_ARGUMENT.txt replace into DB2TESTER.EXPLAIN_ARGUMENT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ARGUMENT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_ARGUMENT.txt
echo db2 load from  $IXFLOC/EXPLAIN_ARGUMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_ARGUMENT.txt replace into DB2INST1.EXPLAIN_ARGUMENT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_ARGUMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_ARGUMENT.txt replace into DB2INST1.EXPLAIN_ARGUMENT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ARGUMENT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.txt
echo db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC.txt replace into DB2TESTER.EXPLAIN_DIAGNOSTIC;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC.txt replace into DB2TESTER.EXPLAIN_DIAGNOSTIC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.txt
echo db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC.txt replace into DB2INST1.EXPLAIN_DIAGNOSTIC;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC.txt replace into DB2INST1.EXPLAIN_DIAGNOSTIC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt
echo db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt replace into DB2TESTER.EXPLAIN_DIAGNOSTIC_DATA;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt replace into DB2TESTER.EXPLAIN_DIAGNOSTIC_DATA; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt
echo db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt replace into DB2INST1.EXPLAIN_DIAGNOSTIC_DATA;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of ixf messages   $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt replace into DB2INST1.EXPLAIN_DIAGNOSTIC_DATA; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_INSTANCE.txt
echo db2 load from  $IXFLOC/EXPLAIN_INSTANCE.ixf of ixf messages   $IXFLOC/EXPLAIN_INSTANCE.txt replace into DB2TESTER.EXPLAIN_INSTANCE;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_INSTANCE.ixf of ixf messages   $IXFLOC/EXPLAIN_INSTANCE.txt replace into DB2TESTER.EXPLAIN_INSTANCE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_INSTANCE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_INSTANCE.txt
echo db2 load from  $IXFLOC/EXPLAIN_INSTANCE.ixf of ixf messages   $IXFLOC/EXPLAIN_INSTANCE.txt replace into DB2INST1.EXPLAIN_INSTANCE;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_INSTANCE.ixf of ixf messages   $IXFLOC/EXPLAIN_INSTANCE.txt replace into DB2INST1.EXPLAIN_INSTANCE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_INSTANCE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_OBJECT.txt
echo db2 load from  $IXFLOC/EXPLAIN_OBJECT.ixf of ixf messages   $IXFLOC/EXPLAIN_OBJECT.txt replace into DB2TESTER.EXPLAIN_OBJECT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_OBJECT.ixf of ixf messages   $IXFLOC/EXPLAIN_OBJECT.txt replace into DB2TESTER.EXPLAIN_OBJECT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OBJECT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_OBJECT.txt
echo db2 load from  $IXFLOC/EXPLAIN_OBJECT.ixf of ixf messages   $IXFLOC/EXPLAIN_OBJECT.txt replace into DB2INST1.EXPLAIN_OBJECT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_OBJECT.ixf of ixf messages   $IXFLOC/EXPLAIN_OBJECT.txt replace into DB2INST1.EXPLAIN_OBJECT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OBJECT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_OPERATOR.txt
echo db2 load from  $IXFLOC/EXPLAIN_OPERATOR.ixf of ixf messages   $IXFLOC/EXPLAIN_OPERATOR.txt replace into DB2TESTER.EXPLAIN_OPERATOR;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_OPERATOR.ixf of ixf messages   $IXFLOC/EXPLAIN_OPERATOR.txt replace into DB2TESTER.EXPLAIN_OPERATOR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OPERATOR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_OPERATOR.txt
echo db2 load from  $IXFLOC/EXPLAIN_OPERATOR.ixf of ixf messages   $IXFLOC/EXPLAIN_OPERATOR.txt replace into DB2INST1.EXPLAIN_OPERATOR;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_OPERATOR.ixf of ixf messages   $IXFLOC/EXPLAIN_OPERATOR.txt replace into DB2INST1.EXPLAIN_OPERATOR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OPERATOR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_PREDICATE.txt
echo db2 load from  $IXFLOC/EXPLAIN_PREDICATE.ixf of ixf messages   $IXFLOC/EXPLAIN_PREDICATE.txt replace into DB2TESTER.EXPLAIN_PREDICATE;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_PREDICATE.ixf of ixf messages   $IXFLOC/EXPLAIN_PREDICATE.txt replace into DB2TESTER.EXPLAIN_PREDICATE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_PREDICATE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_PREDICATE.txt
echo db2 load from  $IXFLOC/EXPLAIN_PREDICATE.ixf of ixf messages   $IXFLOC/EXPLAIN_PREDICATE.txt replace into DB2INST1.EXPLAIN_PREDICATE;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_PREDICATE.ixf of ixf messages   $IXFLOC/EXPLAIN_PREDICATE.txt replace into DB2INST1.EXPLAIN_PREDICATE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_PREDICATE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_STATEMENT.txt
echo db2 load from  $IXFLOC/EXPLAIN_STATEMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_STATEMENT.txt replace into DB2TESTER.EXPLAIN_STATEMENT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_STATEMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_STATEMENT.txt replace into DB2TESTER.EXPLAIN_STATEMENT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STATEMENT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_STATEMENT.txt
echo db2 load from  $IXFLOC/EXPLAIN_STATEMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_STATEMENT.txt replace into DB2INST1.EXPLAIN_STATEMENT;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_STATEMENT.ixf of ixf messages   $IXFLOC/EXPLAIN_STATEMENT.txt replace into DB2INST1.EXPLAIN_STATEMENT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STATEMENT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_STREAM.txt
echo db2 load from  $IXFLOC/EXPLAIN_STREAM.ixf of ixf messages   $IXFLOC/EXPLAIN_STREAM.txt replace into DB2TESTER.EXPLAIN_STREAM;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_STREAM.ixf of ixf messages   $IXFLOC/EXPLAIN_STREAM.txt replace into DB2TESTER.EXPLAIN_STREAM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STREAM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/EXPLAIN_STREAM.txt
echo db2 load from  $IXFLOC/EXPLAIN_STREAM.ixf of ixf messages   $IXFLOC/EXPLAIN_STREAM.txt replace into DB2INST1.EXPLAIN_STREAM;  >>$logfile
     db2 load from  $IXFLOC/EXPLAIN_STREAM.ixf of ixf messages   $IXFLOC/EXPLAIN_STREAM.txt replace into DB2INST1.EXPLAIN_STREAM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STREAM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/HMON_ATM_INFO.txt
echo db2 load from  $IXFLOC/HMON_ATM_INFO.ixf of ixf messages   $IXFLOC/HMON_ATM_INFO.txt replace into SYSTOOLS.HMON_ATM_INFO;  >>$logfile
     db2 load from  $IXFLOC/HMON_ATM_INFO.ixf of ixf messages   $IXFLOC/HMON_ATM_INFO.txt replace into SYSTOOLS.HMON_ATM_INFO; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/HMON_ATM_INFO.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/HMON_COLLECTION.txt
echo db2 load from  $IXFLOC/HMON_COLLECTION.ixf of ixf messages   $IXFLOC/HMON_COLLECTION.txt replace into SYSTOOLS.HMON_COLLECTION;  >>$logfile
     db2 load from  $IXFLOC/HMON_COLLECTION.ixf of ixf messages   $IXFLOC/HMON_COLLECTION.txt replace into SYSTOOLS.HMON_COLLECTION; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/HMON_COLLECTION.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/INTSTAG2.txt
echo db2 load from  $IXFLOC/INTSTAG2.ixf of ixf messages   $IXFLOC/INTSTAG2.txt replace into CLIENT.INTSTAG2;  >>$logfile
     db2 load from  $IXFLOC/INTSTAG2.ixf of ixf messages   $IXFLOC/INTSTAG2.txt replace into CLIENT.INTSTAG2; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/INTSTAG2.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/INTSTAGE.txt
echo db2 load from  $IXFLOC/INTSTAGE.ixf of ixf messages   $IXFLOC/INTSTAGE.txt replace into CLIENT.INTSTAGE;  >>$logfile
     db2 load from  $IXFLOC/INTSTAGE.ixf of ixf messages   $IXFLOC/INTSTAGE.txt replace into CLIENT.INTSTAGE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/INTSTAGE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/MASK_ADDRESS_LOOKUP.txt
echo db2 load from  $IXFLOC/MASK_ADDRESS_LOOKUP.ixf of ixf messages   $IXFLOC/MASK_ADDRESS_LOOKUP.txt replace into UTILITY.MASK_ADDRESS_LOOKUP;  >>$logfile
     db2 load from  $IXFLOC/MASK_ADDRESS_LOOKUP.ixf of ixf messages   $IXFLOC/MASK_ADDRESS_LOOKUP.txt replace into UTILITY.MASK_ADDRESS_LOOKUP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/MASK_ADDRESS_LOOKUP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/NAS_ADVSER_DETAILS.txt
echo db2 load from  $IXFLOC/NAS_ADVSER_DETAILS.ixf of ixf messages   $IXFLOC/NAS_ADVSER_DETAILS.txt replace into AGENT.NAS_ADVSER_DETAILS;  >>$logfile
     db2 load from  $IXFLOC/NAS_ADVSER_DETAILS.ixf of ixf messages   $IXFLOC/NAS_ADVSER_DETAILS.txt replace into AGENT.NAS_ADVSER_DETAILS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/NAS_ADVSER_DETAILS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/NAS_DEALER_DETAILS.txt
echo db2 load from  $IXFLOC/NAS_DEALER_DETAILS.ixf of ixf messages   $IXFLOC/NAS_DEALER_DETAILS.txt replace into AGENT.NAS_DEALER_DETAILS;  >>$logfile
     db2 load from  $IXFLOC/NAS_DEALER_DETAILS.ixf of ixf messages   $IXFLOC/NAS_DEALER_DETAILS.txt replace into AGENT.NAS_DEALER_DETAILS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/NAS_DEALER_DETAILS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/NORTY.txt
echo db2 load from  $IXFLOC/NORTY.ixf of ixf messages   $IXFLOC/NORTY.txt replace into UTILITY.NORTY;  >>$logfile
     db2 load from  $IXFLOC/NORTY.ixf of ixf messages   $IXFLOC/NORTY.txt replace into UTILITY.NORTY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/NORTY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/OBJECT_METRICS.txt
echo db2 load from  $IXFLOC/OBJECT_METRICS.ixf of ixf messages   $IXFLOC/OBJECT_METRICS.txt replace into DB2INST1.OBJECT_METRICS;  >>$logfile
     db2 load from  $IXFLOC/OBJECT_METRICS.ixf of ixf messages   $IXFLOC/OBJECT_METRICS.txt replace into DB2INST1.OBJECT_METRICS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/OBJECT_METRICS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/OFCSTAG2.txt
echo db2 load from  $IXFLOC/OFCSTAG2.ixf of ixf messages   $IXFLOC/OFCSTAG2.txt replace into CLIENT.OFCSTAG2;  >>$logfile
     db2 load from  $IXFLOC/OFCSTAG2.ixf of ixf messages   $IXFLOC/OFCSTAG2.txt replace into CLIENT.OFCSTAG2; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/OFCSTAG2.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/OFCSTAGE.txt
echo db2 load from  $IXFLOC/OFCSTAGE.ixf of ixf messages   $IXFLOC/OFCSTAGE.txt replace into CLIENT.OFCSTAGE;  >>$logfile
     db2 load from  $IXFLOC/OFCSTAGE.ixf of ixf messages   $IXFLOC/OFCSTAGE.txt replace into CLIENT.OFCSTAGE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/OFCSTAGE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/POLICY.txt
echo db2 load from  $IXFLOC/POLICY.ixf of ixf messages   $IXFLOC/POLICY.txt replace into SYSTOOLS.POLICY;  >>$logfile
     db2 load from  $IXFLOC/POLICY.ixf of ixf messages   $IXFLOC/POLICY.txt replace into SYSTOOLS.POLICY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/POLICY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/POLMFENR.txt
echo db2 load from  $IXFLOC/POLMFENR.ixf of ixf messages   $IXFLOC/POLMFENR.txt replace into VOICEBIO.POLMFENR;  >>$logfile
     db2 load from  $IXFLOC/POLMFENR.ixf of ixf messages   $IXFLOC/POLMFENR.txt replace into VOICEBIO.POLMFENR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/POLMFENR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/REQUEST_DETAIL.txt
echo db2 load from  $IXFLOC/REQUEST_DETAIL.ixf of ixf messages   $IXFLOC/REQUEST_DETAIL.txt replace into NUDI.REQUEST_DETAIL;  >>$logfile
     db2 load from  $IXFLOC/REQUEST_DETAIL.ixf of ixf messages   $IXFLOC/REQUEST_DETAIL.txt replace into NUDI.REQUEST_DETAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/REQUEST_DETAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/REQUEST_HEADER.txt
echo db2 load from  $IXFLOC/REQUEST_HEADER.ixf of ixf messages   $IXFLOC/REQUEST_HEADER.txt replace into NUDI.REQUEST_HEADER;  >>$logfile
     db2 load from  $IXFLOC/REQUEST_HEADER.ixf of ixf messages   $IXFLOC/REQUEST_HEADER.txt replace into NUDI.REQUEST_HEADER; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/REQUEST_HEADER.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/REXTEST1.txt
echo db2 load from  $IXFLOC/REXTEST1.ixf of ixf messages   $IXFLOC/REXTEST1.txt replace into DB2INST1.REXTEST1;  >>$logfile
     db2 load from  $IXFLOC/REXTEST1.ixf of ixf messages   $IXFLOC/REXTEST1.txt replace into DB2INST1.REXTEST1; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/REXTEST1.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/REXX_PARMS.txt
echo db2 load from  $IXFLOC/REXX_PARMS.ixf of ixf messages   $IXFLOC/REXX_PARMS.txt replace into UTILITY.REXX_PARMS;  >>$logfile
     db2 load from  $IXFLOC/REXX_PARMS.ixf of ixf messages   $IXFLOC/REXX_PARMS.txt replace into UTILITY.REXX_PARMS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/REXX_PARMS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/STAFFDET.txt
echo db2 load from  $IXFLOC/STAFFDET.ixf of ixf messages   $IXFLOC/STAFFDET.txt replace into VOICEBIO.STAFFDET;  >>$logfile
     db2 load from  $IXFLOC/STAFFDET.ixf of ixf messages   $IXFLOC/STAFFDET.txt replace into VOICEBIO.STAFFDET; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/STAFFDET.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/STAFFREL.txt
echo db2 load from  $IXFLOC/STAFFREL.ixf of ixf messages   $IXFLOC/STAFFREL.txt replace into VOICEBIO.STAFFREL;  >>$logfile
     db2 load from  $IXFLOC/STAFFREL.ixf of ixf messages   $IXFLOC/STAFFREL.txt replace into VOICEBIO.STAFFREL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/STAFFREL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAACTIVY.txt
echo db2 load from  $IXFLOC/TAACTIVY.ixf of ixf messages   $IXFLOC/TAACTIVY.txt replace into CLIENT.TAACTIVY;  >>$logfile
     db2 load from  $IXFLOC/TAACTIVY.ixf of ixf messages   $IXFLOC/TAACTIVY.txt replace into CLIENT.TAACTIVY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAACTIVY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAADVPOL.txt
echo db2 load from  $IXFLOC/TAADVPOL.ixf of ixf messages   $IXFLOC/TAADVPOL.txt replace into CLIENT.TAADVPOL;  >>$logfile
     db2 load from  $IXFLOC/TAADVPOL.ixf of ixf messages   $IXFLOC/TAADVPOL.txt replace into CLIENT.TAADVPOL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAADVPOL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAEMAIL.txt
echo db2 load from  $IXFLOC/TAAEMAIL.ixf of ixf messages   $IXFLOC/TAAEMAIL.txt replace into AGENT.TAAEMAIL;  >>$logfile
     db2 load from  $IXFLOC/TAAEMAIL.ixf of ixf messages   $IXFLOC/TAAEMAIL.txt replace into AGENT.TAAEMAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAEMAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGADLK.txt
echo db2 load from  $IXFLOC/TAAGADLK.ixf of ixf messages   $IXFLOC/TAAGADLK.txt replace into AGENT.TAAGADLK;  >>$logfile
     db2 load from  $IXFLOC/TAAGADLK.ixf of ixf messages   $IXFLOC/TAAGADLK.txt replace into AGENT.TAAGADLK; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGADLK.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGAGAU.txt
echo db2 load from  $IXFLOC/TAAGAGAU.ixf of ixf messages   $IXFLOC/TAAGAGAU.txt replace into CLIENT.TAAGAGAU;  >>$logfile
     db2 load from  $IXFLOC/TAAGAGAU.ixf of ixf messages   $IXFLOC/TAAGAGAU.txt replace into CLIENT.TAAGAGAU; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGAGAU.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGEFAC.txt
echo db2 load from  $IXFLOC/TAAGEFAC.ixf of ixf messages   $IXFLOC/TAAGEFAC.txt replace into CLIENT.TAAGEFAC;  >>$logfile
     db2 load from  $IXFLOC/TAAGEFAC.ixf of ixf messages   $IXFLOC/TAAGEFAC.txt replace into CLIENT.TAAGEFAC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGEFAC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGLRUL.txt
echo db2 load from  $IXFLOC/TAAGLRUL.ixf of ixf messages   $IXFLOC/TAAGLRUL.txt replace into AGENT.TAAGLRUL;  >>$logfile
     db2 load from  $IXFLOC/TAAGLRUL.ixf of ixf messages   $IXFLOC/TAAGLRUL.txt replace into AGENT.TAAGLRUL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGLRUL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGMAIL.txt
echo db2 load from  $IXFLOC/TAAGMAIL.ixf of ixf messages   $IXFLOC/TAAGMAIL.txt replace into AGENT.TAAGMAIL;  >>$logfile
     db2 load from  $IXFLOC/TAAGMAIL.ixf of ixf messages   $IXFLOC/TAAGMAIL.txt replace into AGENT.TAAGMAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGMAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGMREG.txt
echo db2 load from  $IXFLOC/TAAGMREG.ixf of ixf messages   $IXFLOC/TAAGMREG.txt replace into CLIENT.TAAGMREG;  >>$logfile
     db2 load from  $IXFLOC/TAAGMREG.ixf of ixf messages   $IXFLOC/TAAGMREG.txt replace into CLIENT.TAAGMREG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGMREG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGNT.txt
echo db2 load from  $IXFLOC/TAAGNT.ixf of ixf messages   $IXFLOC/TAAGNT.txt replace into AGENT.TAAGNT;  >>$logfile
     db2 load from  $IXFLOC/TAAGNT.ixf of ixf messages   $IXFLOC/TAAGNT.txt replace into AGENT.TAAGNT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGNTOF.txt
echo db2 load from  $IXFLOC/TAAGNTOF.ixf of ixf messages   $IXFLOC/TAAGNTOF.txt replace into AGENT.TAAGNTOF;  >>$logfile
     db2 load from  $IXFLOC/TAAGNTOF.ixf of ixf messages   $IXFLOC/TAAGNTOF.txt replace into AGENT.TAAGNTOF; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNTOF.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGNTOS.txt
echo db2 load from  $IXFLOC/TAAGNTOS.ixf of ixf messages   $IXFLOC/TAAGNTOS.txt replace into AGENT.TAAGNTOS;  >>$logfile
     db2 load from  $IXFLOC/TAAGNTOS.ixf of ixf messages   $IXFLOC/TAAGNTOS.txt replace into AGENT.TAAGNTOS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNTOS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGRACT.txt
echo db2 load from  $IXFLOC/TAAGRACT.ixf of ixf messages   $IXFLOC/TAAGRACT.txt replace into CLIENT.TAAGRACT;  >>$logfile
     db2 load from  $IXFLOC/TAAGRACT.ixf of ixf messages   $IXFLOC/TAAGRACT.txt replace into CLIENT.TAAGRACT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRACT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGRMNT.txt
echo db2 load from  $IXFLOC/TAAGRMNT.ixf of ixf messages   $IXFLOC/TAAGRMNT.txt replace into CLIENT.TAAGRMNT;  >>$logfile
     db2 load from  $IXFLOC/TAAGRMNT.ixf of ixf messages   $IXFLOC/TAAGRMNT.txt replace into CLIENT.TAAGRMNT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRMNT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGRREL.txt
echo db2 load from  $IXFLOC/TAAGRREL.ixf of ixf messages   $IXFLOC/TAAGRREL.txt replace into CLIENT.TAAGRREL;  >>$logfile
     db2 load from  $IXFLOC/TAAGRREL.ixf of ixf messages   $IXFLOC/TAAGRREL.txt replace into CLIENT.TAAGRREL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRREL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGRULE.txt
echo db2 load from  $IXFLOC/TAAGRULE.ixf of ixf messages   $IXFLOC/TAAGRULE.txt replace into AGENT.TAAGRULE;  >>$logfile
     db2 load from  $IXFLOC/TAAGRULE.ixf of ixf messages   $IXFLOC/TAAGRULE.txt replace into AGENT.TAAGRULE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRULE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGRULK.txt
echo db2 load from  $IXFLOC/TAAGRULK.ixf of ixf messages   $IXFLOC/TAAGRULK.txt replace into AGENT.TAAGRULK;  >>$logfile
     db2 load from  $IXFLOC/TAAGRULK.ixf of ixf messages   $IXFLOC/TAAGRULK.txt replace into AGENT.TAAGRULK; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRULK.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGTDED.txt
echo db2 load from  $IXFLOC/TAAGTDED.ixf of ixf messages   $IXFLOC/TAAGTDED.txt replace into AGENT.TAAGTDED;  >>$logfile
     db2 load from  $IXFLOC/TAAGTDED.ixf of ixf messages   $IXFLOC/TAAGTDED.txt replace into AGENT.TAAGTDED; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGTDED.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAGTDEH.txt
echo db2 load from  $IXFLOC/TAAGTDEH.ixf of ixf messages   $IXFLOC/TAAGTDEH.txt replace into AGENT.TAAGTDEH;  >>$logfile
     db2 load from  $IXFLOC/TAAGTDEH.ixf of ixf messages   $IXFLOC/TAAGTDEH.txt replace into AGENT.TAAGTDEH; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGTDEH.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMCNL.txt
echo db2 load from  $IXFLOC/TAAKMCNL.ixf of ixf messages   $IXFLOC/TAAKMCNL.txt replace into AGENT.TAAKMCNL;  >>$logfile
     db2 load from  $IXFLOC/TAAKMCNL.ixf of ixf messages   $IXFLOC/TAAKMCNL.txt replace into AGENT.TAAKMCNL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMCNL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMCNT.txt
echo db2 load from  $IXFLOC/TAAKMCNT.ixf of ixf messages   $IXFLOC/TAAKMCNT.txt replace into AGENT.TAAKMCNT;  >>$logfile
     db2 load from  $IXFLOC/TAAKMCNT.ixf of ixf messages   $IXFLOC/TAAKMCNT.txt replace into AGENT.TAAKMCNT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMCNT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMERR.txt
echo db2 load from  $IXFLOC/TAAKMERR.ixf of ixf messages   $IXFLOC/TAAKMERR.txt replace into AGENT.TAAKMERR;  >>$logfile
     db2 load from  $IXFLOC/TAAKMERR.ixf of ixf messages   $IXFLOC/TAAKMERR.txt replace into AGENT.TAAKMERR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMERR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMIFC.txt
echo db2 load from  $IXFLOC/TAAKMIFC.ixf of ixf messages   $IXFLOC/TAAKMIFC.txt replace into AGENT.TAAKMIFC;  >>$logfile
     db2 load from  $IXFLOC/TAAKMIFC.ixf of ixf messages   $IXFLOC/TAAKMIFC.txt replace into AGENT.TAAKMIFC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMIFC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMIFM.txt
echo db2 load from  $IXFLOC/TAAKMIFM.ixf of ixf messages   $IXFLOC/TAAKMIFM.txt replace into AGENT.TAAKMIFM;  >>$logfile
     db2 load from  $IXFLOC/TAAKMIFM.ixf of ixf messages   $IXFLOC/TAAKMIFM.txt replace into AGENT.TAAKMIFM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMIFM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMSTG.txt
echo db2 load from  $IXFLOC/TAAKMSTG.ixf of ixf messages   $IXFLOC/TAAKMSTG.txt replace into AGENT.TAAKMSTG;  >>$logfile
     db2 load from  $IXFLOC/TAAKMSTG.ixf of ixf messages   $IXFLOC/TAAKMSTG.txt replace into AGENT.TAAKMSTG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMSTG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMSTL.txt
echo db2 load from  $IXFLOC/TAAKMSTL.ixf of ixf messages   $IXFLOC/TAAKMSTL.txt replace into AGENT.TAAKMSTL;  >>$logfile
     db2 load from  $IXFLOC/TAAKMSTL.ixf of ixf messages   $IXFLOC/TAAKMSTL.txt replace into AGENT.TAAKMSTL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMSTL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMTRM.txt
echo db2 load from  $IXFLOC/TAAKMTRM.ixf of ixf messages   $IXFLOC/TAAKMTRM.txt replace into AGENT.TAAKMTRM;  >>$logfile
     db2 load from  $IXFLOC/TAAKMTRM.ixf of ixf messages   $IXFLOC/TAAKMTRM.txt replace into AGENT.TAAKMTRM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMTRM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAKMUPD.txt
echo db2 load from  $IXFLOC/TAAKMUPD.ixf of ixf messages   $IXFLOC/TAAKMUPD.txt replace into AGENT.TAAKMUPD;  >>$logfile
     db2 load from  $IXFLOC/TAAKMUPD.ixf of ixf messages   $IXFLOC/TAAKMUPD.txt replace into AGENT.TAAKMUPD; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMUPD.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAARATES.txt
echo db2 load from  $IXFLOC/TAARATES.ixf of ixf messages   $IXFLOC/TAARATES.txt replace into AGENT.TAARATES;  >>$logfile
     db2 load from  $IXFLOC/TAARATES.ixf of ixf messages   $IXFLOC/TAARATES.txt replace into AGENT.TAARATES; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAARATES.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAASISER.txt
echo db2 load from  $IXFLOC/TAASISER.ixf of ixf messages   $IXFLOC/TAASISER.txt replace into AGENT.TAASISER;  >>$logfile
     db2 load from  $IXFLOC/TAASISER.ixf of ixf messages   $IXFLOC/TAASISER.txt replace into AGENT.TAASISER; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAASISER.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAUTHPR.txt
echo db2 load from  $IXFLOC/TAAUTHPR.ixf of ixf messages   $IXFLOC/TAAUTHPR.txt replace into AGENT.TAAUTHPR;  >>$logfile
     db2 load from  $IXFLOC/TAAUTHPR.ixf of ixf messages   $IXFLOC/TAAUTHPR.txt replace into AGENT.TAAUTHPR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAUTHPR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAAVBI.txt
echo db2 load from  $IXFLOC/TAAVBI.ixf of ixf messages   $IXFLOC/TAAVBI.txt replace into AGENT.TAAVBI;  >>$logfile
     db2 load from  $IXFLOC/TAAVBI.ixf of ixf messages   $IXFLOC/TAAVBI.txt replace into AGENT.TAAVBI; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAAVBI.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TABENNAM.txt
echo db2 load from  $IXFLOC/TABENNAM.ixf of ixf messages   $IXFLOC/TABENNAM.txt replace into CLIENT.TABENNAM;  >>$logfile
     db2 load from  $IXFLOC/TABENNAM.ixf of ixf messages   $IXFLOC/TABENNAM.txt replace into CLIENT.TABENNAM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TABENNAM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TABENNOM.txt
echo db2 load from  $IXFLOC/TABENNOM.ixf of ixf messages   $IXFLOC/TABENNOM.txt replace into CLIENT.TABENNOM;  >>$logfile
     db2 load from  $IXFLOC/TABENNOM.ixf of ixf messages   $IXFLOC/TABENNOM.txt replace into CLIENT.TABENNOM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TABENNOM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TABLMAIL.txt
echo db2 load from  $IXFLOC/TABLMAIL.ixf of ixf messages   $IXFLOC/TABLMAIL.txt replace into AGENT.TABLMAIL;  >>$logfile
     db2 load from  $IXFLOC/TABLMAIL.ixf of ixf messages   $IXFLOC/TABLMAIL.txt replace into AGENT.TABLMAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TABLMAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TABSAMRL.txt
echo db2 load from  $IXFLOC/TABSAMRL.ixf of ixf messages   $IXFLOC/TABSAMRL.txt replace into CLIENT.TABSAMRL;  >>$logfile
     db2 load from  $IXFLOC/TABSAMRL.ixf of ixf messages   $IXFLOC/TABSAMRL.txt replace into CLIENT.TABSAMRL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TABSAMRL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLAERR.txt
echo db2 load from  $IXFLOC/TACLAERR.ixf of ixf messages   $IXFLOC/TACLAERR.txt replace into RULES.TACLAERR;  >>$logfile
     db2 load from  $IXFLOC/TACLAERR.ixf of ixf messages   $IXFLOC/TACLAERR.txt replace into RULES.TACLAERR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAERR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLAGCP.txt
echo db2 load from  $IXFLOC/TACLAGCP.ixf of ixf messages   $IXFLOC/TACLAGCP.txt replace into CLIENT.TACLAGCP;  >>$logfile
     db2 load from  $IXFLOC/TACLAGCP.ixf of ixf messages   $IXFLOC/TACLAGCP.txt replace into CLIENT.TACLAGCP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAGCP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLAMSG.txt
echo db2 load from  $IXFLOC/TACLAMSG.ixf of ixf messages   $IXFLOC/TACLAMSG.txt replace into RULES.TACLAMSG;  >>$logfile
     db2 load from  $IXFLOC/TACLAMSG.ixf of ixf messages   $IXFLOC/TACLAMSG.txt replace into RULES.TACLAMSG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAMSG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLAPTY.txt
echo db2 load from  $IXFLOC/TACLAPTY.ixf of ixf messages   $IXFLOC/TACLAPTY.txt replace into RULES.TACLAPTY;  >>$logfile
     db2 load from  $IXFLOC/TACLAPTY.ixf of ixf messages   $IXFLOC/TACLAPTY.txt replace into RULES.TACLAPTY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAPTY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLAROL.txt
echo db2 load from  $IXFLOC/TACLAROL.ixf of ixf messages   $IXFLOC/TACLAROL.txt replace into RULES.TACLAROL;  >>$logfile
     db2 load from  $IXFLOC/TACLAROL.ixf of ixf messages   $IXFLOC/TACLAROL.txt replace into RULES.TACLAROL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAROL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLASPC.txt
echo db2 load from  $IXFLOC/TACLASPC.ixf of ixf messages   $IXFLOC/TACLASPC.txt replace into RULES.TACLASPC;  >>$logfile
     db2 load from  $IXFLOC/TACLASPC.ixf of ixf messages   $IXFLOC/TACLASPC.txt replace into RULES.TACLASPC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASPC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLASRL.txt
echo db2 load from  $IXFLOC/TACLASRL.ixf of ixf messages   $IXFLOC/TACLASRL.txt replace into RULES.TACLASRL;  >>$logfile
     db2 load from  $IXFLOC/TACLASRL.ixf of ixf messages   $IXFLOC/TACLASRL.txt replace into RULES.TACLASRL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASRL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLASSF.txt
echo db2 load from  $IXFLOC/TACLASSF.ixf of ixf messages   $IXFLOC/TACLASSF.txt replace into RULES.TACLASSF;  >>$logfile
     db2 load from  $IXFLOC/TACLASSF.ixf of ixf messages   $IXFLOC/TACLASSF.txt replace into RULES.TACLASSF; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASSF.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLASTP.txt
echo db2 load from  $IXFLOC/TACLASTP.ixf of ixf messages   $IXFLOC/TACLASTP.txt replace into RULES.TACLASTP;  >>$logfile
     db2 load from  $IXFLOC/TACLASTP.ixf of ixf messages   $IXFLOC/TACLASTP.txt replace into RULES.TACLASTP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASTP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLIENT.txt
echo db2 load from  $IXFLOC/TACLIENT.ixf of ixf messages   $IXFLOC/TACLIENT.txt replace into CLIENT.TACLIENT;  >>$logfile
     db2 load from  $IXFLOC/TACLIENT.ixf of ixf messages   $IXFLOC/TACLIENT.txt replace into CLIENT.TACLIENT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLIENT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLNTAC.txt
echo db2 load from  $IXFLOC/TACLNTAC.ixf of ixf messages   $IXFLOC/TACLNTAC.txt replace into CLIENT.TACLNTAC;  >>$logfile
     db2 load from  $IXFLOC/TACLNTAC.ixf of ixf messages   $IXFLOC/TACLNTAC.txt replace into CLIENT.TACLNTAC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTAC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLNTAG.txt
echo db2 load from  $IXFLOC/TACLNTAG.ixf of ixf messages   $IXFLOC/TACLNTAG.txt replace into CLIENT.TACLNTAG;  >>$logfile
     db2 load from  $IXFLOC/TACLNTAG.ixf of ixf messages   $IXFLOC/TACLNTAG.txt replace into CLIENT.TACLNTAG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTAG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLNTPL.txt
echo db2 load from  $IXFLOC/TACLNTPL.ixf of ixf messages   $IXFLOC/TACLNTPL.txt replace into CLIENT.TACLNTPL;  >>$logfile
     db2 load from  $IXFLOC/TACLNTPL.ixf of ixf messages   $IXFLOC/TACLNTPL.txt replace into CLIENT.TACLNTPL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTPL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTACT.txt
echo db2 load from  $IXFLOC/TACLTACT.ixf of ixf messages   $IXFLOC/TACLTACT.txt replace into CLIENT.TACLTACT;  >>$logfile
     db2 load from  $IXFLOC/TACLTACT.ixf of ixf messages   $IXFLOC/TACLTACT.txt replace into CLIENT.TACLTACT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTACT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTCON.txt
echo db2 load from  $IXFLOC/TACLTCON.ixf of ixf messages   $IXFLOC/TACLTCON.txt replace into CLIENT.TACLTCON;  >>$logfile
     db2 load from  $IXFLOC/TACLTCON.ixf of ixf messages   $IXFLOC/TACLTCON.txt replace into CLIENT.TACLTCON; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTCON.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTDET.txt
echo db2 load from  $IXFLOC/TACLTDET.ixf of ixf messages   $IXFLOC/TACLTDET.txt replace into CLIENT.TACLTDET;  >>$logfile
     db2 load from  $IXFLOC/TACLTDET.ixf of ixf messages   $IXFLOC/TACLTDET.txt replace into CLIENT.TACLTDET; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTDET.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTOBJ.txt
echo db2 load from  $IXFLOC/TACLTOBJ.ixf of ixf messages   $IXFLOC/TACLTOBJ.txt replace into CLIENT.TACLTOBJ;  >>$logfile
     db2 load from  $IXFLOC/TACLTOBJ.ixf of ixf messages   $IXFLOC/TACLTOBJ.txt replace into CLIENT.TACLTOBJ; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTOBJ.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTREG.txt
echo db2 load from  $IXFLOC/TACLTREG.ixf of ixf messages   $IXFLOC/TACLTREG.txt replace into CLIENT.TACLTREG;  >>$logfile
     db2 load from  $IXFLOC/TACLTREG.ixf of ixf messages   $IXFLOC/TACLTREG.txt replace into CLIENT.TACLTREG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTREG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTREL.txt
echo db2 load from  $IXFLOC/TACLTREL.ixf of ixf messages   $IXFLOC/TACLTREL.txt replace into CLIENT.TACLTREL;  >>$logfile
     db2 load from  $IXFLOC/TACLTREL.ixf of ixf messages   $IXFLOC/TACLTREL.txt replace into CLIENT.TACLTREL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTREL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTRUL.txt
echo db2 load from  $IXFLOC/TACLTRUL.ixf of ixf messages   $IXFLOC/TACLTRUL.txt replace into AGENT.TACLTRUL;  >>$logfile
     db2 load from  $IXFLOC/TACLTRUL.ixf of ixf messages   $IXFLOC/TACLTRUL.txt replace into AGENT.TACLTRUL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTRUL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTSPC.txt
echo db2 load from  $IXFLOC/TACLTSPC.ixf of ixf messages   $IXFLOC/TACLTSPC.txt replace into CLIENT.TACLTSPC;  >>$logfile
     db2 load from  $IXFLOC/TACLTSPC.ixf of ixf messages   $IXFLOC/TACLTSPC.txt replace into CLIENT.TACLTSPC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTSPC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACLTTFN.txt
echo db2 load from  $IXFLOC/TACLTTFN.ixf of ixf messages   $IXFLOC/TACLTTFN.txt replace into CLIENT.TACLTTFN;  >>$logfile
     db2 load from  $IXFLOC/TACLTTFN.ixf of ixf messages   $IXFLOC/TACLTTFN.txt replace into CLIENT.TACLTTFN; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTTFN.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACMSLNK.txt
echo db2 load from  $IXFLOC/TACMSLNK.ixf of ixf messages   $IXFLOC/TACMSLNK.txt replace into CLIENT.TACMSLNK;  >>$logfile
     db2 load from  $IXFLOC/TACMSLNK.ixf of ixf messages   $IXFLOC/TACMSLNK.txt replace into CLIENT.TACMSLNK; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACMSLNK.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACONTDT.txt
echo db2 load from  $IXFLOC/TACONTDT.ixf of ixf messages   $IXFLOC/TACONTDT.txt replace into CLIENT.TACONTDT;  >>$logfile
     db2 load from  $IXFLOC/TACONTDT.ixf of ixf messages   $IXFLOC/TACONTDT.txt replace into CLIENT.TACONTDT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACONTDT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACONTHD.txt
echo db2 load from  $IXFLOC/TACONTHD.ixf of ixf messages   $IXFLOC/TACONTHD.txt replace into CLIENT.TACONTHD;  >>$logfile
     db2 load from  $IXFLOC/TACONTHD.ixf of ixf messages   $IXFLOC/TACONTHD.txt replace into CLIENT.TACONTHD; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACONTHD.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACONVEN.txt
echo db2 load from  $IXFLOC/TACONVEN.ixf of ixf messages   $IXFLOC/TACONVEN.txt replace into AGENT.TACONVEN;  >>$logfile
     db2 load from  $IXFLOC/TACONVEN.ixf of ixf messages   $IXFLOC/TACONVEN.txt replace into AGENT.TACONVEN; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACONVEN.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACPCLRG.txt
echo db2 load from  $IXFLOC/TACPCLRG.ixf of ixf messages   $IXFLOC/TACPCLRG.txt replace into CLIENT.TACPCLRG;  >>$logfile
     db2 load from  $IXFLOC/TACPCLRG.ixf of ixf messages   $IXFLOC/TACPCLRG.txt replace into CLIENT.TACPCLRG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACPCLRG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TACUSTPR.txt
echo db2 load from  $IXFLOC/TACUSTPR.ixf of ixf messages   $IXFLOC/TACUSTPR.txt replace into AGENT.TACUSTPR;  >>$logfile
     db2 load from  $IXFLOC/TACUSTPR.ixf of ixf messages   $IXFLOC/TACUSTPR.txt replace into AGENT.TACUSTPR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TACUSTPR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TADAFEED.txt
echo db2 load from  $IXFLOC/TADAFEED.ixf of ixf messages   $IXFLOC/TADAFEED.txt replace into AGENT.TADAFEED;  >>$logfile
     db2 load from  $IXFLOC/TADAFEED.ixf of ixf messages   $IXFLOC/TADAFEED.txt replace into AGENT.TADAFEED; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TADAFEED.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TADEFFAC.txt
echo db2 load from  $IXFLOC/TADEFFAC.ixf of ixf messages   $IXFLOC/TADEFFAC.txt replace into CLIENT.TADEFFAC;  >>$logfile
     db2 load from  $IXFLOC/TADEFFAC.ixf of ixf messages   $IXFLOC/TADEFFAC.txt replace into CLIENT.TADEFFAC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TADEFFAC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TADISCNT.txt
echo db2 load from  $IXFLOC/TADISCNT.ixf of ixf messages   $IXFLOC/TADISCNT.txt replace into AGENT.TADISCNT;  >>$logfile
     db2 load from  $IXFLOC/TADISCNT.ixf of ixf messages   $IXFLOC/TADISCNT.txt replace into AGENT.TADISCNT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TADISCNT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TADUMMY.txt
echo db2 load from  $IXFLOC/TADUMMY.ixf of ixf messages   $IXFLOC/TADUMMY.txt replace into CLIENT.TADUMMY;  >>$logfile
     db2 load from  $IXFLOC/TADUMMY.ixf of ixf messages   $IXFLOC/TADUMMY.txt replace into CLIENT.TADUMMY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TADUMMY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TADUMMY.txt
echo db2 load from  $IXFLOC/TADUMMY.ixf of ixf messages   $IXFLOC/TADUMMY.txt replace into UTILITY.TADUMMY;  >>$logfile
     db2 load from  $IXFLOC/TADUMMY.ixf of ixf messages   $IXFLOC/TADUMMY.txt replace into UTILITY.TADUMMY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TADUMMY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAEMAIL.txt
echo db2 load from  $IXFLOC/TAEMAIL.ixf of ixf messages   $IXFLOC/TAEMAIL.txt replace into AGENT.TAEMAIL;  >>$logfile
     db2 load from  $IXFLOC/TAEMAIL.ixf of ixf messages   $IXFLOC/TAEMAIL.txt replace into AGENT.TAEMAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAEMAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAEMLDAT.txt
echo db2 load from  $IXFLOC/TAEMLDAT.ixf of ixf messages   $IXFLOC/TAEMLDAT.txt replace into AGENT.TAEMLDAT;  >>$logfile
     db2 load from  $IXFLOC/TAEMLDAT.ixf of ixf messages   $IXFLOC/TAEMLDAT.txt replace into AGENT.TAEMLDAT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAEMLDAT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAERRMSG.txt
echo db2 load from  $IXFLOC/TAERRMSG.ixf of ixf messages   $IXFLOC/TAERRMSG.txt replace into RULES.TAERRMSG;  >>$logfile
     db2 load from  $IXFLOC/TAERRMSG.ixf of ixf messages   $IXFLOC/TAERRMSG.txt replace into RULES.TAERRMSG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRMSG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAERRORS.txt
echo db2 load from  $IXFLOC/TAERRORS.ixf of ixf messages   $IXFLOC/TAERRORS.txt replace into UTILITY.TAERRORS;  >>$logfile
     db2 load from  $IXFLOC/TAERRORS.ixf of ixf messages   $IXFLOC/TAERRORS.txt replace into UTILITY.TAERRORS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRORS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAERRTYP.txt
echo db2 load from  $IXFLOC/TAERRTYP.ixf of ixf messages   $IXFLOC/TAERRTYP.txt replace into RULES.TAERRTYP;  >>$logfile
     db2 load from  $IXFLOC/TAERRTYP.ixf of ixf messages   $IXFLOC/TAERRTYP.txt replace into RULES.TAERRTYP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRTYP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAFAD.txt
echo db2 load from  $IXFLOC/TAFAD.ixf of ixf messages   $IXFLOC/TAFAD.txt replace into CLIENT.TAFAD;  >>$logfile
     db2 load from  $IXFLOC/TAFAD.ixf of ixf messages   $IXFLOC/TAFAD.txt replace into CLIENT.TAFAD; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAFAD.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAFSY.txt
echo db2 load from  $IXFLOC/TAFSY.ixf of ixf messages   $IXFLOC/TAFSY.txt replace into UTILITY.TAFSY;  >>$logfile
     db2 load from  $IXFLOC/TAFSY.ixf of ixf messages   $IXFLOC/TAFSY.txt replace into UTILITY.TAFSY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAFSY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAGNTCOM.txt
echo db2 load from  $IXFLOC/TAGNTCOM.ixf of ixf messages   $IXFLOC/TAGNTCOM.txt replace into AGENT.TAGNTCOM;  >>$logfile
     db2 load from  $IXFLOC/TAGNTCOM.ixf of ixf messages   $IXFLOC/TAGNTCOM.txt replace into AGENT.TAGNTCOM; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAGNTCOM.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAGPAYBL.txt
echo db2 load from  $IXFLOC/TAGPAYBL.ixf of ixf messages   $IXFLOC/TAGPAYBL.txt replace into AGENT.TAGPAYBL;  >>$logfile
     db2 load from  $IXFLOC/TAGPAYBL.ixf of ixf messages   $IXFLOC/TAGPAYBL.txt replace into AGENT.TAGPAYBL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAGPAYBL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAKAMACT.txt
echo db2 load from  $IXFLOC/TAKAMACT.ixf of ixf messages   $IXFLOC/TAKAMACT.txt replace into AGENT.TAKAMACT;  >>$logfile
     db2 load from  $IXFLOC/TAKAMACT.ixf of ixf messages   $IXFLOC/TAKAMACT.txt replace into AGENT.TAKAMACT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAKAMACT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAMESRUL.txt
echo db2 load from  $IXFLOC/TAMESRUL.ixf of ixf messages   $IXFLOC/TAMESRUL.txt replace into SUPER.TAMESRUL;  >>$logfile
     db2 load from  $IXFLOC/TAMESRUL.ixf of ixf messages   $IXFLOC/TAMESRUL.txt replace into SUPER.TAMESRUL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESRUL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAMESTGP.txt
echo db2 load from  $IXFLOC/TAMESTGP.ixf of ixf messages   $IXFLOC/TAMESTGP.txt replace into SUPER.TAMESTGP;  >>$logfile
     db2 load from  $IXFLOC/TAMESTGP.ixf of ixf messages   $IXFLOC/TAMESTGP.txt replace into SUPER.TAMESTGP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESTGP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAMESTXN.txt
echo db2 load from  $IXFLOC/TAMESTXN.ixf of ixf messages   $IXFLOC/TAMESTXN.txt replace into SUPER.TAMESTXN;  >>$logfile
     db2 load from  $IXFLOC/TAMESTXN.ixf of ixf messages   $IXFLOC/TAMESTXN.txt replace into SUPER.TAMESTXN; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESTXN.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANAMAGR.txt
echo db2 load from  $IXFLOC/TANAMAGR.ixf of ixf messages   $IXFLOC/TANAMAGR.txt replace into CLIENT.TANAMAGR;  >>$logfile
     db2 load from  $IXFLOC/TANAMAGR.ixf of ixf messages   $IXFLOC/TANAMAGR.txt replace into CLIENT.TANAMAGR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMAGR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANAMCOY.txt
echo db2 load from  $IXFLOC/TANAMCOY.ixf of ixf messages   $IXFLOC/TANAMCOY.txt replace into CLIENT.TANAMCOY;  >>$logfile
     db2 load from  $IXFLOC/TANAMCOY.ixf of ixf messages   $IXFLOC/TANAMCOY.txt replace into CLIENT.TANAMCOY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMCOY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANAME.txt
echo db2 load from  $IXFLOC/TANAME.ixf of ixf messages   $IXFLOC/TANAME.txt replace into CLIENT.TANAME;  >>$logfile
     db2 load from  $IXFLOC/TANAME.ixf of ixf messages   $IXFLOC/TANAME.txt replace into CLIENT.TANAME; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANAME.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANAMREG.txt
echo db2 load from  $IXFLOC/TANAMREG.ixf of ixf messages   $IXFLOC/TANAMREG.txt replace into CLIENT.TANAMREG;  >>$logfile
     db2 load from  $IXFLOC/TANAMREG.ixf of ixf messages   $IXFLOC/TANAMREG.txt replace into CLIENT.TANAMREG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMREG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANEXTNO.txt
echo db2 load from  $IXFLOC/TANEXTNO.ixf of ixf messages   $IXFLOC/TANEXTNO.txt replace into UTILITY.TANEXTNO;  >>$logfile
     db2 load from  $IXFLOC/TANEXTNO.ixf of ixf messages   $IXFLOC/TANEXTNO.txt replace into UTILITY.TANEXTNO; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANEXTNO.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TANOTES.txt
echo db2 load from  $IXFLOC/TANOTES.ixf of ixf messages   $IXFLOC/TANOTES.txt replace into AGENT.TANOTES;  >>$logfile
     db2 load from  $IXFLOC/TANOTES.ixf of ixf messages   $IXFLOC/TANOTES.txt replace into AGENT.TANOTES; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TANOTES.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOACTRG.txt
echo db2 load from  $IXFLOC/TAOACTRG.ixf of ixf messages   $IXFLOC/TAOACTRG.txt replace into CLIENT.TAOACTRG;  >>$logfile
     db2 load from  $IXFLOC/TAOACTRG.ixf of ixf messages   $IXFLOC/TAOACTRG.txt replace into CLIENT.TAOACTRG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOACTRG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJAGR.txt
echo db2 load from  $IXFLOC/TAOBJAGR.ixf of ixf messages   $IXFLOC/TAOBJAGR.txt replace into CLIENT.TAOBJAGR;  >>$logfile
     db2 load from  $IXFLOC/TAOBJAGR.ixf of ixf messages   $IXFLOC/TAOBJAGR.txt replace into CLIENT.TAOBJAGR; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJAGR.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJECT.txt
echo db2 load from  $IXFLOC/TAOBJECT.ixf of ixf messages   $IXFLOC/TAOBJECT.txt replace into CLIENT.TAOBJECT;  >>$logfile
     db2 load from  $IXFLOC/TAOBJECT.ixf of ixf messages   $IXFLOC/TAOBJECT.txt replace into CLIENT.TAOBJECT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJECT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJSTE.txt
echo db2 load from  $IXFLOC/TAOBJSTE.ixf of ixf messages   $IXFLOC/TAOBJSTE.txt replace into CLIENT.TAOBJSTE;  >>$logfile
     db2 load from  $IXFLOC/TAOBJSTE.ixf of ixf messages   $IXFLOC/TAOBJSTE.txt replace into CLIENT.TAOBJSTE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJSTE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJTAC.txt
echo db2 load from  $IXFLOC/TAOBJTAC.ixf of ixf messages   $IXFLOC/TAOBJTAC.txt replace into CLIENT.TAOBJTAC;  >>$logfile
     db2 load from  $IXFLOC/TAOBJTAC.ixf of ixf messages   $IXFLOC/TAOBJTAC.txt replace into CLIENT.TAOBJTAC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTAC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJTRG.txt
echo db2 load from  $IXFLOC/TAOBJTRG.ixf of ixf messages   $IXFLOC/TAOBJTRG.txt replace into CLIENT.TAOBJTRG;  >>$logfile
     db2 load from  $IXFLOC/TAOBJTRG.ixf of ixf messages   $IXFLOC/TAOBJTRG.txt replace into CLIENT.TAOBJTRG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTRG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOBJTRL.txt
echo db2 load from  $IXFLOC/TAOBJTRL.ixf of ixf messages   $IXFLOC/TAOBJTRL.txt replace into CLIENT.TAOBJTRL;  >>$logfile
     db2 load from  $IXFLOC/TAOBJTRL.ixf of ixf messages   $IXFLOC/TAOBJTRL.txt replace into CLIENT.TAOBJTRL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTRL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAOFFICE.txt
echo db2 load from  $IXFLOC/TAOFFICE.ixf of ixf messages   $IXFLOC/TAOFFICE.txt replace into AGENT.TAOFFICE;  >>$logfile
     db2 load from  $IXFLOC/TAOFFICE.ixf of ixf messages   $IXFLOC/TAOFFICE.txt replace into AGENT.TAOFFICE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAOFFICE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAORLREG.txt
echo db2 load from  $IXFLOC/TAORLREG.ixf of ixf messages   $IXFLOC/TAORLREG.txt replace into CLIENT.TAORLREG;  >>$logfile
     db2 load from  $IXFLOC/TAORLREG.ixf of ixf messages   $IXFLOC/TAORLREG.txt replace into CLIENT.TAORLREG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAORLREG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPLACE.txt
echo db2 load from  $IXFLOC/TAPLACE.ixf of ixf messages   $IXFLOC/TAPLACE.txt replace into CLIENT.TAPLACE;  >>$logfile
     db2 load from  $IXFLOC/TAPLACE.ixf of ixf messages   $IXFLOC/TAPLACE.txt replace into CLIENT.TAPLACE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLACE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPLCECP.txt
echo db2 load from  $IXFLOC/TAPLCECP.ixf of ixf messages   $IXFLOC/TAPLCECP.txt replace into CLIENT.TAPLCECP;  >>$logfile
     db2 load from  $IXFLOC/TAPLCECP.ixf of ixf messages   $IXFLOC/TAPLCECP.txt replace into CLIENT.TAPLCECP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCECP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPLCLAB.txt
echo db2 load from  $IXFLOC/TAPLCLAB.ixf of ixf messages   $IXFLOC/TAPLCLAB.txt replace into CLIENT.TAPLCLAB;  >>$logfile
     db2 load from  $IXFLOC/TAPLCLAB.ixf of ixf messages   $IXFLOC/TAPLCLAB.txt replace into CLIENT.TAPLCLAB; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCLAB.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPLCREL.txt
echo db2 load from  $IXFLOC/TAPLCREL.ixf of ixf messages   $IXFLOC/TAPLCREL.txt replace into CLIENT.TAPLCREL;  >>$logfile
     db2 load from  $IXFLOC/TAPLCREL.ixf of ixf messages   $IXFLOC/TAPLCREL.txt replace into CLIENT.TAPLCREL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCREL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPOLEXT.txt
echo db2 load from  $IXFLOC/TAPOLEXT.ixf of ixf messages   $IXFLOC/TAPOLEXT.txt replace into CLIENT.TAPOLEXT;  >>$logfile
     db2 load from  $IXFLOC/TAPOLEXT.ixf of ixf messages   $IXFLOC/TAPOLEXT.txt replace into CLIENT.TAPOLEXT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPOLEXT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPROCTL.txt
echo db2 load from  $IXFLOC/TAPROCTL.ixf of ixf messages   $IXFLOC/TAPROCTL.txt replace into UTILITY.TAPROCTL;  >>$logfile
     db2 load from  $IXFLOC/TAPROCTL.ixf of ixf messages   $IXFLOC/TAPROCTL.txt replace into UTILITY.TAPROCTL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPROCTL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAPROPTY.txt
echo db2 load from  $IXFLOC/TAPROPTY.ixf of ixf messages   $IXFLOC/TAPROPTY.txt replace into RULES.TAPROPTY;  >>$logfile
     db2 load from  $IXFLOC/TAPROPTY.ixf of ixf messages   $IXFLOC/TAPROPTY.txt replace into RULES.TAPROPTY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAPROPTY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAREGIST.txt
echo db2 load from  $IXFLOC/TAREGIST.ixf of ixf messages   $IXFLOC/TAREGIST.txt replace into CLIENT.TAREGIST;  >>$logfile
     db2 load from  $IXFLOC/TAREGIST.ixf of ixf messages   $IXFLOC/TAREGIST.txt replace into CLIENT.TAREGIST; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAREGIST.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TARELDET.txt
echo db2 load from  $IXFLOC/TARELDET.ixf of ixf messages   $IXFLOC/TARELDET.txt replace into AGENT.TARELDET;  >>$logfile
     db2 load from  $IXFLOC/TARELDET.ixf of ixf messages   $IXFLOC/TARELDET.txt replace into AGENT.TARELDET; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TARELDET.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAROLETP.txt
echo db2 load from  $IXFLOC/TAROLETP.ixf of ixf messages   $IXFLOC/TAROLETP.txt replace into RULES.TAROLETP;  >>$logfile
     db2 load from  $IXFLOC/TAROLETP.ixf of ixf messages   $IXFLOC/TAROLETP.txt replace into RULES.TAROLETP; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAROLETP.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TARPTDLY.txt
echo db2 load from  $IXFLOC/TARPTDLY.ixf of ixf messages   $IXFLOC/TARPTDLY.txt replace into AGENT.TARPTDLY;  >>$logfile
     db2 load from  $IXFLOC/TARPTDLY.ixf of ixf messages   $IXFLOC/TARPTDLY.txt replace into AGENT.TARPTDLY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TARPTDLY.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TARSTART.txt
echo db2 load from  $IXFLOC/TARSTART.ixf of ixf messages   $IXFLOC/TARSTART.txt replace into UTILITY.TARSTART;  >>$logfile
     db2 load from  $IXFLOC/TARSTART.ixf of ixf messages   $IXFLOC/TARSTART.txt replace into UTILITY.TARSTART; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TARSTART.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASECURE.txt
echo db2 load from  $IXFLOC/TASECURE.ixf of ixf messages   $IXFLOC/TASECURE.txt replace into AGENT.TASECURE;  >>$logfile
     db2 load from  $IXFLOC/TASECURE.ixf of ixf messages   $IXFLOC/TASECURE.txt replace into AGENT.TASECURE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASECURE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASPECIF.txt
echo db2 load from  $IXFLOC/TASPECIF.ixf of ixf messages   $IXFLOC/TASPECIF.txt replace into RULES.TASPECIF;  >>$logfile
     db2 load from  $IXFLOC/TASPECIF.ixf of ixf messages   $IXFLOC/TASPECIF.txt replace into RULES.TASPECIF; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASPECIF.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASPECRL.txt
echo db2 load from  $IXFLOC/TASPECRL.ixf of ixf messages   $IXFLOC/TASPECRL.txt replace into RULES.TASPECRL;  >>$logfile
     db2 load from  $IXFLOC/TASPECRL.ixf of ixf messages   $IXFLOC/TASPECRL.txt replace into RULES.TASPECRL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASPECRL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASQLTXT.txt
echo db2 load from  $IXFLOC/TASQLTXT.ixf of ixf messages   $IXFLOC/TASQLTXT.txt replace into AGENT.TASQLTXT;  >>$logfile
     db2 load from  $IXFLOC/TASQLTXT.ixf of ixf messages   $IXFLOC/TASQLTXT.txt replace into AGENT.TASQLTXT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASQLTXT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTEREG.txt
echo db2 load from  $IXFLOC/TASTEREG.ixf of ixf messages   $IXFLOC/TASTEREG.txt replace into CLIENT.TASTEREG;  >>$logfile
     db2 load from  $IXFLOC/TASTEREG.ixf of ixf messages   $IXFLOC/TASTEREG.txt replace into CLIENT.TASTEREG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTEREG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTD2.txt
echo db2 load from  $IXFLOC/TASTMTD2.ixf of ixf messages   $IXFLOC/TASTMTD2.txt replace into AGENT.TASTMTD2;  >>$logfile
     db2 load from  $IXFLOC/TASTMTD2.ixf of ixf messages   $IXFLOC/TASTMTD2.txt replace into AGENT.TASTMTD2; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTD2.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTDT.txt
echo db2 load from  $IXFLOC/TASTMTDT.ixf of ixf messages   $IXFLOC/TASTMTDT.txt replace into AGENT.TASTMTDT;  >>$logfile
     db2 load from  $IXFLOC/TASTMTDT.ixf of ixf messages   $IXFLOC/TASTMTDT.txt replace into AGENT.TASTMTDT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTDT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTHD.txt
echo db2 load from  $IXFLOC/TASTMTHD.ixf of ixf messages   $IXFLOC/TASTMTHD.txt replace into AGENT.TASTMTHD;  >>$logfile
     db2 load from  $IXFLOC/TASTMTHD.ixf of ixf messages   $IXFLOC/TASTMTHD.txt replace into AGENT.TASTMTHD; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTHD.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTHS.txt
echo db2 load from  $IXFLOC/TASTMTHS.ixf of ixf messages   $IXFLOC/TASTMTHS.txt replace into AGENT.TASTMTHS;  >>$logfile
     db2 load from  $IXFLOC/TASTMTHS.ixf of ixf messages   $IXFLOC/TASTMTHS.txt replace into AGENT.TASTMTHS; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTHS.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTLG.txt
echo db2 load from  $IXFLOC/TASTMTLG.ixf of ixf messages   $IXFLOC/TASTMTLG.txt replace into AGENT.TASTMTLG;  >>$logfile
     db2 load from  $IXFLOC/TASTMTLG.ixf of ixf messages   $IXFLOC/TASTMTLG.txt replace into AGENT.TASTMTLG; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTLG.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TASTMTNA.txt
echo db2 load from  $IXFLOC/TASTMTNA.ixf of ixf messages   $IXFLOC/TASTMTNA.txt replace into AGENT.TASTMTNA;  >>$logfile
     db2 load from  $IXFLOC/TASTMTNA.ixf of ixf messages   $IXFLOC/TASTMTNA.txt replace into AGENT.TASTMTNA; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTNA.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TATRADE.txt
echo db2 load from  $IXFLOC/TATRADE.ixf of ixf messages   $IXFLOC/TATRADE.txt replace into SUPER.TATRADE;  >>$logfile
     db2 load from  $IXFLOC/TATRADE.ixf of ixf messages   $IXFLOC/TATRADE.txt replace into SUPER.TATRADE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TATRADE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TATYPE.txt
echo db2 load from  $IXFLOC/TATYPE.ixf of ixf messages   $IXFLOC/TATYPE.txt replace into RULES.TATYPE;  >>$logfile
     db2 load from  $IXFLOC/TATYPE.ixf of ixf messages   $IXFLOC/TATYPE.txt replace into RULES.TATYPE; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TATYPE.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAWELLET.txt
echo db2 load from  $IXFLOC/TAWELLET.ixf of ixf messages   $IXFLOC/TAWELLET.txt replace into AGENT.TAWELLET;  >>$logfile
     db2 load from  $IXFLOC/TAWELLET.ixf of ixf messages   $IXFLOC/TAWELLET.txt replace into AGENT.TAWELLET; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAWELLET.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAWLMAIL.txt
echo db2 load from  $IXFLOC/TAWLMAIL.ixf of ixf messages   $IXFLOC/TAWLMAIL.txt replace into AGENT.TAWLMAIL;  >>$logfile
     db2 load from  $IXFLOC/TAWLMAIL.ixf of ixf messages   $IXFLOC/TAWLMAIL.txt replace into AGENT.TAWLMAIL; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLMAIL.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAWLPTXT.txt
echo db2 load from  $IXFLOC/TAWLPTXT.ixf of ixf messages   $IXFLOC/TAWLPTXT.txt replace into AGENT.TAWLPTXT;  >>$logfile
     db2 load from  $IXFLOC/TAWLPTXT.ixf of ixf messages   $IXFLOC/TAWLPTXT.txt replace into AGENT.TAWLPTXT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLPTXT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAWLTPLT.txt
echo db2 load from  $IXFLOC/TAWLTPLT.ixf of ixf messages   $IXFLOC/TAWLTPLT.txt replace into AGENT.TAWLTPLT;  >>$logfile
     db2 load from  $IXFLOC/TAWLTPLT.ixf of ixf messages   $IXFLOC/TAWLTPLT.txt replace into AGENT.TAWLTPLT; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLTPLT.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TAYRSFAC.txt
echo db2 load from  $IXFLOC/TAYRSFAC.ixf of ixf messages   $IXFLOC/TAYRSFAC.txt replace into CLIENT.TAYRSFAC;  >>$logfile
     db2 load from  $IXFLOC/TAYRSFAC.ixf of ixf messages   $IXFLOC/TAYRSFAC.txt replace into CLIENT.TAYRSFAC; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TAYRSFAC.txt >>$logfile
echo  '#** **'   >>$logfile

rm -f $IXFLOC/TEMPPOLICY.txt
echo db2 load from  $IXFLOC/TEMPPOLICY.ixf of ixf messages   $IXFLOC/TEMPPOLICY.txt replace into AGENT.TEMPPOLICY;  >>$logfile
     db2 load from  $IXFLOC/TEMPPOLICY.ixf of ixf messages   $IXFLOC/TEMPPOLICY.txt replace into AGENT.TEMPPOLICY; >>$logfile
echo  '#** **'   >>$logfile
cat $IXFLOC/TEMPPOLICY.txt >>$logfile
echo  '#** **'   >>$logfile



cat $logfile
exit