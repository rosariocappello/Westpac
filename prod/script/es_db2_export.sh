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

IXFLOC=$ENVTOP/ixffiles
export IXFLOC

logfile=$ENVTOP/logs/db2_export.log
export logfile

rm -f $logfile
 
             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
  
db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD >>$logfile

rm -f $IXFLOC/ADMINCNF.ixf
rm -f $IXFLOC/ADMINCNF.txt
echo db2 export to  $IXFLOC/ADMINCNF.ixf of IXF messages $IXFLOC/ADMINCNF.txt select  '*' FROM 'AGENT'.'ADMINCNF';  >>$logfile
     db2 export to  $IXFLOC/ADMINCNF.ixf of IXF messages $IXFLOC/ADMINCNF.txt select  '*' FROM 'AGENT'.'ADMINCNF';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADMINCNF.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADOSTAG2.ixf
rm -f $IXFLOC/ADOSTAG2.txt
echo db2 export to  $IXFLOC/ADOSTAG2.ixf of IXF messages $IXFLOC/ADOSTAG2.txt select  '*' FROM 'CLIENT'.'ADOSTAG2';  >>$logfile
     db2 export to  $IXFLOC/ADOSTAG2.ixf of IXF messages $IXFLOC/ADOSTAG2.txt select  '*' FROM 'CLIENT'.'ADOSTAG2';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADOSTAG2.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADOSTAGE.ixf
rm -f $IXFLOC/ADOSTAGE.txt
echo db2 export to  $IXFLOC/ADOSTAGE.ixf of IXF messages $IXFLOC/ADOSTAGE.txt select  '*' FROM 'CLIENT'.'ADOSTAGE';  >>$logfile
     db2 export to  $IXFLOC/ADOSTAGE.ixf of IXF messages $IXFLOC/ADOSTAGE.txt select  '*' FROM 'CLIENT'.'ADOSTAGE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADOSTAGE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVADCNF.ixf
rm -f $IXFLOC/ADVADCNF.txt
echo db2 export to  $IXFLOC/ADVADCNF.ixf of IXF messages $IXFLOC/ADVADCNF.txt select  '*' FROM 'AGENT'.'ADVADCNF';  >>$logfile
     db2 export to  $IXFLOC/ADVADCNF.ixf of IXF messages $IXFLOC/ADVADCNF.txt select  '*' FROM 'AGENT'.'ADVADCNF';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVADCNF.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVAPADM.ixf
rm -f $IXFLOC/ADVAPADM.txt
echo db2 export to  $IXFLOC/ADVAPADM.ixf of IXF messages $IXFLOC/ADVAPADM.txt select  '*' FROM 'AGENT'.'ADVAPADM';  >>$logfile
     db2 export to  $IXFLOC/ADVAPADM.ixf of IXF messages $IXFLOC/ADVAPADM.txt select  '*' FROM 'AGENT'.'ADVAPADM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVAPADM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVIMPLG.ixf
rm -f $IXFLOC/ADVIMPLG.txt
echo db2 export to  $IXFLOC/ADVIMPLG.ixf of IXF messages $IXFLOC/ADVIMPLG.txt select  '*' FROM 'AGENT'.'ADVIMPLG';  >>$logfile
     db2 export to  $IXFLOC/ADVIMPLG.ixf of IXF messages $IXFLOC/ADVIMPLG.txt select  '*' FROM 'AGENT'.'ADVIMPLG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVIMPLG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_INDEX.ixf
rm -f $IXFLOC/ADVISE_INDEX.txt
echo db2 export to  $IXFLOC/ADVISE_INDEX.ixf of IXF messages $IXFLOC/ADVISE_INDEX.txt select  '*' FROM 'DB2INST1'.'ADVISE_INDEX';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_INDEX.ixf of IXF messages $IXFLOC/ADVISE_INDEX.txt select  '*' FROM 'DB2INST1'.'ADVISE_INDEX';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_INDEX.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_INSTANCE.ixf
rm -f $IXFLOC/ADVISE_INSTANCE.txt
echo db2 export to  $IXFLOC/ADVISE_INSTANCE.ixf of IXF messages $IXFLOC/ADVISE_INSTANCE.txt select  '*' FROM 'DB2INST1'.'ADVISE_INSTANCE';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_INSTANCE.ixf of IXF messages $IXFLOC/ADVISE_INSTANCE.txt select  '*' FROM 'DB2INST1'.'ADVISE_INSTANCE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_INSTANCE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_MQT.ixf
rm -f $IXFLOC/ADVISE_MQT.txt
echo db2 export to  $IXFLOC/ADVISE_MQT.ixf of IXF messages $IXFLOC/ADVISE_MQT.txt select  '*' FROM 'DB2INST1'.'ADVISE_MQT';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_MQT.ixf of IXF messages $IXFLOC/ADVISE_MQT.txt select  '*' FROM 'DB2INST1'.'ADVISE_MQT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_MQT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_PARTITION.ixf
rm -f $IXFLOC/ADVISE_PARTITION.txt
echo db2 export to  $IXFLOC/ADVISE_PARTITION.ixf of IXF messages $IXFLOC/ADVISE_PARTITION.txt select  '*' FROM 'DB2INST1'.'ADVISE_PARTITION';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_PARTITION.ixf of IXF messages $IXFLOC/ADVISE_PARTITION.txt select  '*' FROM 'DB2INST1'.'ADVISE_PARTITION';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_PARTITION.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_TABLE.ixf
rm -f $IXFLOC/ADVISE_TABLE.txt
echo db2 export to  $IXFLOC/ADVISE_TABLE.ixf of IXF messages $IXFLOC/ADVISE_TABLE.txt select  '*' FROM 'DB2INST1'.'ADVISE_TABLE';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_TABLE.ixf of IXF messages $IXFLOC/ADVISE_TABLE.txt select  '*' FROM 'DB2INST1'.'ADVISE_TABLE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_TABLE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVISE_WORKLOAD.ixf
rm -f $IXFLOC/ADVISE_WORKLOAD.txt
echo db2 export to  $IXFLOC/ADVISE_WORKLOAD.ixf of IXF messages $IXFLOC/ADVISE_WORKLOAD.txt select  '*' FROM 'DB2INST1'.'ADVISE_WORKLOAD';  >>$logfile
     db2 export to  $IXFLOC/ADVISE_WORKLOAD.ixf of IXF messages $IXFLOC/ADVISE_WORKLOAD.txt select  '*' FROM 'DB2INST1'.'ADVISE_WORKLOAD';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVISE_WORKLOAD.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVSTAG2.ixf
rm -f $IXFLOC/ADVSTAG2.txt
echo db2 export to  $IXFLOC/ADVSTAG2.ixf of IXF messages $IXFLOC/ADVSTAG2.txt select  '*' FROM 'AGENT'.'ADVSTAG2';  >>$logfile
     db2 export to  $IXFLOC/ADVSTAG2.ixf of IXF messages $IXFLOC/ADVSTAG2.txt select  '*' FROM 'AGENT'.'ADVSTAG2';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVSTAG2.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/ADVSTAGE.ixf
rm -f $IXFLOC/ADVSTAGE.txt
echo db2 export to  $IXFLOC/ADVSTAGE.ixf of IXF messages $IXFLOC/ADVSTAGE.txt select  '*' FROM 'AGENT'.'ADVSTAGE';  >>$logfile
     db2 export to  $IXFLOC/ADVSTAGE.ixf of IXF messages $IXFLOC/ADVSTAGE.txt select  '*' FROM 'AGENT'.'ADVSTAGE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/ADVSTAGE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_ACTUALS.ixf
rm -f $IXFLOC/EXPLAIN_ACTUALS.txt
echo db2 export to  $IXFLOC/EXPLAIN_ACTUALS.ixf of IXF messages $IXFLOC/EXPLAIN_ACTUALS.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_ACTUALS';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_ACTUALS.ixf of IXF messages $IXFLOC/EXPLAIN_ACTUALS.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_ACTUALS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ACTUALS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_ARGUMENT.ixf
rm -f $IXFLOC/EXPLAIN_ARGUMENT.txt
echo db2 export to  $IXFLOC/EXPLAIN_ARGUMENT.ixf of IXF messages $IXFLOC/EXPLAIN_ARGUMENT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_ARGUMENT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_ARGUMENT.ixf of IXF messages $IXFLOC/EXPLAIN_ARGUMENT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_ARGUMENT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ARGUMENT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_ARGUMENT.ixf
rm -f $IXFLOC/EXPLAIN_ARGUMENT.txt
echo db2 export to  $IXFLOC/EXPLAIN_ARGUMENT.ixf of IXF messages $IXFLOC/EXPLAIN_ARGUMENT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_ARGUMENT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_ARGUMENT.ixf of IXF messages $IXFLOC/EXPLAIN_ARGUMENT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_ARGUMENT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_ARGUMENT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf
rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.txt
echo db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf
rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC.txt
echo db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf
rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt
echo db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf
rm -f $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt
echo db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.ixf of IXF messages $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_DIAGNOSTIC_DATA.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_INSTANCE.ixf
rm -f $IXFLOC/EXPLAIN_INSTANCE.txt
echo db2 export to  $IXFLOC/EXPLAIN_INSTANCE.ixf of IXF messages $IXFLOC/EXPLAIN_INSTANCE.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_INSTANCE';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_INSTANCE.ixf of IXF messages $IXFLOC/EXPLAIN_INSTANCE.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_INSTANCE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_INSTANCE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_INSTANCE.ixf
rm -f $IXFLOC/EXPLAIN_INSTANCE.txt
echo db2 export to  $IXFLOC/EXPLAIN_INSTANCE.ixf of IXF messages $IXFLOC/EXPLAIN_INSTANCE.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_INSTANCE';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_INSTANCE.ixf of IXF messages $IXFLOC/EXPLAIN_INSTANCE.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_INSTANCE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_INSTANCE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_OBJECT.ixf
rm -f $IXFLOC/EXPLAIN_OBJECT.txt
echo db2 export to  $IXFLOC/EXPLAIN_OBJECT.ixf of IXF messages $IXFLOC/EXPLAIN_OBJECT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_OBJECT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_OBJECT.ixf of IXF messages $IXFLOC/EXPLAIN_OBJECT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_OBJECT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OBJECT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_OBJECT.ixf
rm -f $IXFLOC/EXPLAIN_OBJECT.txt
echo db2 export to  $IXFLOC/EXPLAIN_OBJECT.ixf of IXF messages $IXFLOC/EXPLAIN_OBJECT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_OBJECT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_OBJECT.ixf of IXF messages $IXFLOC/EXPLAIN_OBJECT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_OBJECT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OBJECT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_OPERATOR.ixf
rm -f $IXFLOC/EXPLAIN_OPERATOR.txt
echo db2 export to  $IXFLOC/EXPLAIN_OPERATOR.ixf of IXF messages $IXFLOC/EXPLAIN_OPERATOR.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_OPERATOR';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_OPERATOR.ixf of IXF messages $IXFLOC/EXPLAIN_OPERATOR.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_OPERATOR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OPERATOR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_OPERATOR.ixf
rm -f $IXFLOC/EXPLAIN_OPERATOR.txt
echo db2 export to  $IXFLOC/EXPLAIN_OPERATOR.ixf of IXF messages $IXFLOC/EXPLAIN_OPERATOR.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_OPERATOR';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_OPERATOR.ixf of IXF messages $IXFLOC/EXPLAIN_OPERATOR.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_OPERATOR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_OPERATOR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_PREDICATE.ixf
rm -f $IXFLOC/EXPLAIN_PREDICATE.txt
echo db2 export to  $IXFLOC/EXPLAIN_PREDICATE.ixf of IXF messages $IXFLOC/EXPLAIN_PREDICATE.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_PREDICATE';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_PREDICATE.ixf of IXF messages $IXFLOC/EXPLAIN_PREDICATE.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_PREDICATE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_PREDICATE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_PREDICATE.ixf
rm -f $IXFLOC/EXPLAIN_PREDICATE.txt
echo db2 export to  $IXFLOC/EXPLAIN_PREDICATE.ixf of IXF messages $IXFLOC/EXPLAIN_PREDICATE.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_PREDICATE';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_PREDICATE.ixf of IXF messages $IXFLOC/EXPLAIN_PREDICATE.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_PREDICATE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_PREDICATE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_STATEMENT.ixf
rm -f $IXFLOC/EXPLAIN_STATEMENT.txt
echo db2 export to  $IXFLOC/EXPLAIN_STATEMENT.ixf of IXF messages $IXFLOC/EXPLAIN_STATEMENT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_STATEMENT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_STATEMENT.ixf of IXF messages $IXFLOC/EXPLAIN_STATEMENT.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_STATEMENT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STATEMENT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_STATEMENT.ixf
rm -f $IXFLOC/EXPLAIN_STATEMENT.txt
echo db2 export to  $IXFLOC/EXPLAIN_STATEMENT.ixf of IXF messages $IXFLOC/EXPLAIN_STATEMENT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_STATEMENT';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_STATEMENT.ixf of IXF messages $IXFLOC/EXPLAIN_STATEMENT.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_STATEMENT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STATEMENT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_STREAM.ixf
rm -f $IXFLOC/EXPLAIN_STREAM.txt
echo db2 export to  $IXFLOC/EXPLAIN_STREAM.ixf of IXF messages $IXFLOC/EXPLAIN_STREAM.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_STREAM';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_STREAM.ixf of IXF messages $IXFLOC/EXPLAIN_STREAM.txt select  '*' FROM 'DB2TESTER'.'EXPLAIN_STREAM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STREAM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/EXPLAIN_STREAM.ixf
rm -f $IXFLOC/EXPLAIN_STREAM.txt
echo db2 export to  $IXFLOC/EXPLAIN_STREAM.ixf of IXF messages $IXFLOC/EXPLAIN_STREAM.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_STREAM';  >>$logfile
     db2 export to  $IXFLOC/EXPLAIN_STREAM.ixf of IXF messages $IXFLOC/EXPLAIN_STREAM.txt select  '*' FROM 'DB2INST1'.'EXPLAIN_STREAM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/EXPLAIN_STREAM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/HMON_ATM_INFO.ixf
rm -f $IXFLOC/HMON_ATM_INFO.txt
echo db2 export to  $IXFLOC/HMON_ATM_INFO.ixf of IXF messages $IXFLOC/HMON_ATM_INFO.txt select  '*' FROM 'SYSTOOLS'.'HMON_ATM_INFO';  >>$logfile
     db2 export to  $IXFLOC/HMON_ATM_INFO.ixf of IXF messages $IXFLOC/HMON_ATM_INFO.txt select  '*' FROM 'SYSTOOLS'.'HMON_ATM_INFO';
  echo  '#** **'   >>$logfile
cat $IXFLOC/HMON_ATM_INFO.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/HMON_COLLECTION.ixf
rm -f $IXFLOC/HMON_COLLECTION.txt
echo db2 export to  $IXFLOC/HMON_COLLECTION.ixf of IXF messages $IXFLOC/HMON_COLLECTION.txt select  '*' FROM 'SYSTOOLS'.'HMON_COLLECTION';  >>$logfile
     db2 export to  $IXFLOC/HMON_COLLECTION.ixf of IXF messages $IXFLOC/HMON_COLLECTION.txt select  '*' FROM 'SYSTOOLS'.'HMON_COLLECTION';
  echo  '#** **'   >>$logfile
cat $IXFLOC/HMON_COLLECTION.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/INTSTAG2.ixf
rm -f $IXFLOC/INTSTAG2.txt
echo db2 export to  $IXFLOC/INTSTAG2.ixf of IXF messages $IXFLOC/INTSTAG2.txt select  '*' FROM 'CLIENT'.'INTSTAG2';  >>$logfile
     db2 export to  $IXFLOC/INTSTAG2.ixf of IXF messages $IXFLOC/INTSTAG2.txt select  '*' FROM 'CLIENT'.'INTSTAG2';
  echo  '#** **'   >>$logfile
cat $IXFLOC/INTSTAG2.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/INTSTAGE.ixf
rm -f $IXFLOC/INTSTAGE.txt
echo db2 export to  $IXFLOC/INTSTAGE.ixf of IXF messages $IXFLOC/INTSTAGE.txt select  '*' FROM 'CLIENT'.'INTSTAGE';  >>$logfile
     db2 export to  $IXFLOC/INTSTAGE.ixf of IXF messages $IXFLOC/INTSTAGE.txt select  '*' FROM 'CLIENT'.'INTSTAGE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/INTSTAGE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/MASK_ADDRESS_LOOKUP.ixf
rm -f $IXFLOC/MASK_ADDRESS_LOOKUP.txt
echo db2 export to  $IXFLOC/MASK_ADDRESS_LOOKUP.ixf of IXF messages $IXFLOC/MASK_ADDRESS_LOOKUP.txt select  '*' FROM 'UTILITY'.'MASK_ADDRESS_LOOKUP';  >>$logfile
     db2 export to  $IXFLOC/MASK_ADDRESS_LOOKUP.ixf of IXF messages $IXFLOC/MASK_ADDRESS_LOOKUP.txt select  '*' FROM 'UTILITY'.'MASK_ADDRESS_LOOKUP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/MASK_ADDRESS_LOOKUP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/NAS_ADVSER_DETAILS.ixf
rm -f $IXFLOC/NAS_ADVSER_DETAILS.txt
echo db2 export to  $IXFLOC/NAS_ADVSER_DETAILS.ixf of IXF messages $IXFLOC/NAS_ADVSER_DETAILS.txt select  '*' FROM 'AGENT'.'NAS_ADVSER_DETAILS';  >>$logfile
     db2 export to  $IXFLOC/NAS_ADVSER_DETAILS.ixf of IXF messages $IXFLOC/NAS_ADVSER_DETAILS.txt select  '*' FROM 'AGENT'.'NAS_ADVSER_DETAILS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/NAS_ADVSER_DETAILS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/NAS_DEALER_DETAILS.ixf
rm -f $IXFLOC/NAS_DEALER_DETAILS.txt
echo db2 export to  $IXFLOC/NAS_DEALER_DETAILS.ixf of IXF messages $IXFLOC/NAS_DEALER_DETAILS.txt select  '*' FROM 'AGENT'.'NAS_DEALER_DETAILS';  >>$logfile
     db2 export to  $IXFLOC/NAS_DEALER_DETAILS.ixf of IXF messages $IXFLOC/NAS_DEALER_DETAILS.txt select  '*' FROM 'AGENT'.'NAS_DEALER_DETAILS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/NAS_DEALER_DETAILS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/NORTY.ixf
rm -f $IXFLOC/NORTY.txt
echo db2 export to  $IXFLOC/NORTY.ixf of IXF messages $IXFLOC/NORTY.txt select  '*' FROM 'UTILITY'.'NORTY';  >>$logfile
     db2 export to  $IXFLOC/NORTY.ixf of IXF messages $IXFLOC/NORTY.txt select  '*' FROM 'UTILITY'.'NORTY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/NORTY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/OBJECT_METRICS.ixf
rm -f $IXFLOC/OBJECT_METRICS.txt
echo db2 export to  $IXFLOC/OBJECT_METRICS.ixf of IXF messages $IXFLOC/OBJECT_METRICS.txt select  '*' FROM 'DB2INST1'.'OBJECT_METRICS';  >>$logfile
     db2 export to  $IXFLOC/OBJECT_METRICS.ixf of IXF messages $IXFLOC/OBJECT_METRICS.txt select  '*' FROM 'DB2INST1'.'OBJECT_METRICS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/OBJECT_METRICS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/OFCSTAG2.ixf
rm -f $IXFLOC/OFCSTAG2.txt
echo db2 export to  $IXFLOC/OFCSTAG2.ixf of IXF messages $IXFLOC/OFCSTAG2.txt select  '*' FROM 'CLIENT'.'OFCSTAG2';  >>$logfile
     db2 export to  $IXFLOC/OFCSTAG2.ixf of IXF messages $IXFLOC/OFCSTAG2.txt select  '*' FROM 'CLIENT'.'OFCSTAG2';
  echo  '#** **'   >>$logfile
cat $IXFLOC/OFCSTAG2.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/OFCSTAGE.ixf
rm -f $IXFLOC/OFCSTAGE.txt
echo db2 export to  $IXFLOC/OFCSTAGE.ixf of IXF messages $IXFLOC/OFCSTAGE.txt select  '*' FROM 'CLIENT'.'OFCSTAGE';  >>$logfile
     db2 export to  $IXFLOC/OFCSTAGE.ixf of IXF messages $IXFLOC/OFCSTAGE.txt select  '*' FROM 'CLIENT'.'OFCSTAGE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/OFCSTAGE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/POLICY.ixf
rm -f $IXFLOC/POLICY.txt
echo db2 export to  $IXFLOC/POLICY.ixf of IXF messages $IXFLOC/POLICY.txt select  '*' FROM 'SYSTOOLS'.'POLICY';  >>$logfile
     db2 export to  $IXFLOC/POLICY.ixf of IXF messages $IXFLOC/POLICY.txt select  '*' FROM 'SYSTOOLS'.'POLICY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/POLICY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/POLMFENR.ixf
rm -f $IXFLOC/POLMFENR.txt
echo db2 export to  $IXFLOC/POLMFENR.ixf of IXF messages $IXFLOC/POLMFENR.txt select  '*' FROM 'VOICEBIO'.'POLMFENR';  >>$logfile
     db2 export to  $IXFLOC/POLMFENR.ixf of IXF messages $IXFLOC/POLMFENR.txt select  '*' FROM 'VOICEBIO'.'POLMFENR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/POLMFENR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/REQUEST_DETAIL.ixf
rm -f $IXFLOC/REQUEST_DETAIL.txt
echo db2 export to  $IXFLOC/REQUEST_DETAIL.ixf of IXF messages $IXFLOC/REQUEST_DETAIL.txt select  '*' FROM 'NUDI'.'REQUEST_DETAIL';  >>$logfile
     db2 export to  $IXFLOC/REQUEST_DETAIL.ixf of IXF messages $IXFLOC/REQUEST_DETAIL.txt select  '*' FROM 'NUDI'.'REQUEST_DETAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/REQUEST_DETAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/REQUEST_HEADER.ixf
rm -f $IXFLOC/REQUEST_HEADER.txt
echo db2 export to  $IXFLOC/REQUEST_HEADER.ixf of IXF messages $IXFLOC/REQUEST_HEADER.txt select  '*' FROM 'NUDI'.'REQUEST_HEADER';  >>$logfile
     db2 export to  $IXFLOC/REQUEST_HEADER.ixf of IXF messages $IXFLOC/REQUEST_HEADER.txt select  '*' FROM 'NUDI'.'REQUEST_HEADER';
  echo  '#** **'   >>$logfile
cat $IXFLOC/REQUEST_HEADER.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/REXTEST1.ixf
rm -f $IXFLOC/REXTEST1.txt
echo db2 export to  $IXFLOC/REXTEST1.ixf of IXF messages $IXFLOC/REXTEST1.txt select  '*' FROM 'DB2INST1'.'REXTEST1';  >>$logfile
     db2 export to  $IXFLOC/REXTEST1.ixf of IXF messages $IXFLOC/REXTEST1.txt select  '*' FROM 'DB2INST1'.'REXTEST1';
  echo  '#** **'   >>$logfile
cat $IXFLOC/REXTEST1.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/REXX_PARMS.ixf
rm -f $IXFLOC/REXX_PARMS.txt
echo db2 export to  $IXFLOC/REXX_PARMS.ixf of IXF messages $IXFLOC/REXX_PARMS.txt select  '*' FROM 'UTILITY'.'REXX_PARMS';  >>$logfile
     db2 export to  $IXFLOC/REXX_PARMS.ixf of IXF messages $IXFLOC/REXX_PARMS.txt select  '*' FROM 'UTILITY'.'REXX_PARMS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/REXX_PARMS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/STAFFDET.ixf
rm -f $IXFLOC/STAFFDET.txt
echo db2 export to  $IXFLOC/STAFFDET.ixf of IXF messages $IXFLOC/STAFFDET.txt select  '*' FROM 'VOICEBIO'.'STAFFDET';  >>$logfile
     db2 export to  $IXFLOC/STAFFDET.ixf of IXF messages $IXFLOC/STAFFDET.txt select  '*' FROM 'VOICEBIO'.'STAFFDET';
  echo  '#** **'   >>$logfile
cat $IXFLOC/STAFFDET.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/STAFFREL.ixf
rm -f $IXFLOC/STAFFREL.txt
echo db2 export to  $IXFLOC/STAFFREL.ixf of IXF messages $IXFLOC/STAFFREL.txt select  '*' FROM 'VOICEBIO'.'STAFFREL';  >>$logfile
     db2 export to  $IXFLOC/STAFFREL.ixf of IXF messages $IXFLOC/STAFFREL.txt select  '*' FROM 'VOICEBIO'.'STAFFREL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/STAFFREL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAACTIVY.ixf
rm -f $IXFLOC/TAACTIVY.txt
echo db2 export to  $IXFLOC/TAACTIVY.ixf of IXF messages $IXFLOC/TAACTIVY.txt select  '*' FROM 'CLIENT'.'TAACTIVY';  >>$logfile
     db2 export to  $IXFLOC/TAACTIVY.ixf of IXF messages $IXFLOC/TAACTIVY.txt select  '*' FROM 'CLIENT'.'TAACTIVY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAACTIVY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAADVPOL.ixf
rm -f $IXFLOC/TAADVPOL.txt
echo db2 export to  $IXFLOC/TAADVPOL.ixf of IXF messages $IXFLOC/TAADVPOL.txt select  '*' FROM 'CLIENT'.'TAADVPOL';  >>$logfile
     db2 export to  $IXFLOC/TAADVPOL.ixf of IXF messages $IXFLOC/TAADVPOL.txt select  '*' FROM 'CLIENT'.'TAADVPOL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAADVPOL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAEMAIL.ixf
rm -f $IXFLOC/TAAEMAIL.txt
echo db2 export to  $IXFLOC/TAAEMAIL.ixf of IXF messages $IXFLOC/TAAEMAIL.txt select  '*' FROM 'AGENT'.'TAAEMAIL';  >>$logfile
     db2 export to  $IXFLOC/TAAEMAIL.ixf of IXF messages $IXFLOC/TAAEMAIL.txt select  '*' FROM 'AGENT'.'TAAEMAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAEMAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGADLK.ixf
rm -f $IXFLOC/TAAGADLK.txt
echo db2 export to  $IXFLOC/TAAGADLK.ixf of IXF messages $IXFLOC/TAAGADLK.txt select  '*' FROM 'AGENT'.'TAAGADLK';  >>$logfile
     db2 export to  $IXFLOC/TAAGADLK.ixf of IXF messages $IXFLOC/TAAGADLK.txt select  '*' FROM 'AGENT'.'TAAGADLK';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGADLK.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGAGAU.ixf
rm -f $IXFLOC/TAAGAGAU.txt
echo db2 export to  $IXFLOC/TAAGAGAU.ixf of IXF messages $IXFLOC/TAAGAGAU.txt select  '*' FROM 'CLIENT'.'TAAGAGAU';  >>$logfile
     db2 export to  $IXFLOC/TAAGAGAU.ixf of IXF messages $IXFLOC/TAAGAGAU.txt select  '*' FROM 'CLIENT'.'TAAGAGAU';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGAGAU.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGEFAC.ixf
rm -f $IXFLOC/TAAGEFAC.txt
echo db2 export to  $IXFLOC/TAAGEFAC.ixf of IXF messages $IXFLOC/TAAGEFAC.txt select  '*' FROM 'CLIENT'.'TAAGEFAC';  >>$logfile
     db2 export to  $IXFLOC/TAAGEFAC.ixf of IXF messages $IXFLOC/TAAGEFAC.txt select  '*' FROM 'CLIENT'.'TAAGEFAC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGEFAC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGLRUL.ixf
rm -f $IXFLOC/TAAGLRUL.txt
echo db2 export to  $IXFLOC/TAAGLRUL.ixf of IXF messages $IXFLOC/TAAGLRUL.txt select  '*' FROM 'AGENT'.'TAAGLRUL';  >>$logfile
     db2 export to  $IXFLOC/TAAGLRUL.ixf of IXF messages $IXFLOC/TAAGLRUL.txt select  '*' FROM 'AGENT'.'TAAGLRUL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGLRUL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGMAIL.ixf
rm -f $IXFLOC/TAAGMAIL.txt
echo db2 export to  $IXFLOC/TAAGMAIL.ixf of IXF messages $IXFLOC/TAAGMAIL.txt select  '*' FROM 'AGENT'.'TAAGMAIL';  >>$logfile
     db2 export to  $IXFLOC/TAAGMAIL.ixf of IXF messages $IXFLOC/TAAGMAIL.txt select  '*' FROM 'AGENT'.'TAAGMAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGMAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGMREG.ixf
rm -f $IXFLOC/TAAGMREG.txt
echo db2 export to  $IXFLOC/TAAGMREG.ixf of IXF messages $IXFLOC/TAAGMREG.txt select  '*' FROM 'CLIENT'.'TAAGMREG';  >>$logfile
     db2 export to  $IXFLOC/TAAGMREG.ixf of IXF messages $IXFLOC/TAAGMREG.txt select  '*' FROM 'CLIENT'.'TAAGMREG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGMREG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGNT.ixf
rm -f $IXFLOC/TAAGNT.txt
echo db2 export to  $IXFLOC/TAAGNT.ixf of IXF messages $IXFLOC/TAAGNT.txt select  '*' FROM 'AGENT'.'TAAGNT';  >>$logfile
     db2 export to  $IXFLOC/TAAGNT.ixf of IXF messages $IXFLOC/TAAGNT.txt select  '*' FROM 'AGENT'.'TAAGNT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGNTOF.ixf
rm -f $IXFLOC/TAAGNTOF.txt
echo db2 export to  $IXFLOC/TAAGNTOF.ixf of IXF messages $IXFLOC/TAAGNTOF.txt select  '*' FROM 'AGENT'.'TAAGNTOF';  >>$logfile
     db2 export to  $IXFLOC/TAAGNTOF.ixf of IXF messages $IXFLOC/TAAGNTOF.txt select  '*' FROM 'AGENT'.'TAAGNTOF';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNTOF.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGNTOS.ixf
rm -f $IXFLOC/TAAGNTOS.txt
echo db2 export to  $IXFLOC/TAAGNTOS.ixf of IXF messages $IXFLOC/TAAGNTOS.txt select  '*' FROM 'AGENT'.'TAAGNTOS';  >>$logfile
     db2 export to  $IXFLOC/TAAGNTOS.ixf of IXF messages $IXFLOC/TAAGNTOS.txt select  '*' FROM 'AGENT'.'TAAGNTOS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGNTOS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGRACT.ixf
rm -f $IXFLOC/TAAGRACT.txt
echo db2 export to  $IXFLOC/TAAGRACT.ixf of IXF messages $IXFLOC/TAAGRACT.txt select  '*' FROM 'CLIENT'.'TAAGRACT';  >>$logfile
     db2 export to  $IXFLOC/TAAGRACT.ixf of IXF messages $IXFLOC/TAAGRACT.txt select  '*' FROM 'CLIENT'.'TAAGRACT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRACT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGRMNT.ixf
rm -f $IXFLOC/TAAGRMNT.txt
echo db2 export to  $IXFLOC/TAAGRMNT.ixf of IXF messages $IXFLOC/TAAGRMNT.txt select  '*' FROM 'CLIENT'.'TAAGRMNT';  >>$logfile
     db2 export to  $IXFLOC/TAAGRMNT.ixf of IXF messages $IXFLOC/TAAGRMNT.txt select  '*' FROM 'CLIENT'.'TAAGRMNT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRMNT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGRREL.ixf
rm -f $IXFLOC/TAAGRREL.txt
echo db2 export to  $IXFLOC/TAAGRREL.ixf of IXF messages $IXFLOC/TAAGRREL.txt select  '*' FROM 'CLIENT'.'TAAGRREL';  >>$logfile
     db2 export to  $IXFLOC/TAAGRREL.ixf of IXF messages $IXFLOC/TAAGRREL.txt select  '*' FROM 'CLIENT'.'TAAGRREL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRREL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGRULE.ixf
rm -f $IXFLOC/TAAGRULE.txt
echo db2 export to  $IXFLOC/TAAGRULE.ixf of IXF messages $IXFLOC/TAAGRULE.txt select  '*' FROM 'AGENT'.'TAAGRULE';  >>$logfile
     db2 export to  $IXFLOC/TAAGRULE.ixf of IXF messages $IXFLOC/TAAGRULE.txt select  '*' FROM 'AGENT'.'TAAGRULE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRULE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGRULK.ixf
rm -f $IXFLOC/TAAGRULK.txt
echo db2 export to  $IXFLOC/TAAGRULK.ixf of IXF messages $IXFLOC/TAAGRULK.txt select  '*' FROM 'AGENT'.'TAAGRULK';  >>$logfile
     db2 export to  $IXFLOC/TAAGRULK.ixf of IXF messages $IXFLOC/TAAGRULK.txt select  '*' FROM 'AGENT'.'TAAGRULK';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGRULK.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGTDED.ixf
rm -f $IXFLOC/TAAGTDED.txt
echo db2 export to  $IXFLOC/TAAGTDED.ixf of IXF messages $IXFLOC/TAAGTDED.txt select  '*' FROM 'AGENT'.'TAAGTDED';  >>$logfile
     db2 export to  $IXFLOC/TAAGTDED.ixf of IXF messages $IXFLOC/TAAGTDED.txt select  '*' FROM 'AGENT'.'TAAGTDED';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGTDED.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAGTDEH.ixf
rm -f $IXFLOC/TAAGTDEH.txt
echo db2 export to  $IXFLOC/TAAGTDEH.ixf of IXF messages $IXFLOC/TAAGTDEH.txt select  '*' FROM 'AGENT'.'TAAGTDEH';  >>$logfile
     db2 export to  $IXFLOC/TAAGTDEH.ixf of IXF messages $IXFLOC/TAAGTDEH.txt select  '*' FROM 'AGENT'.'TAAGTDEH';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAGTDEH.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMCNL.ixf
rm -f $IXFLOC/TAAKMCNL.txt
echo db2 export to  $IXFLOC/TAAKMCNL.ixf of IXF messages $IXFLOC/TAAKMCNL.txt select  '*' FROM 'AGENT'.'TAAKMCNL';  >>$logfile
     db2 export to  $IXFLOC/TAAKMCNL.ixf of IXF messages $IXFLOC/TAAKMCNL.txt select  '*' FROM 'AGENT'.'TAAKMCNL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMCNL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMCNT.ixf
rm -f $IXFLOC/TAAKMCNT.txt
echo db2 export to  $IXFLOC/TAAKMCNT.ixf of IXF messages $IXFLOC/TAAKMCNT.txt select  '*' FROM 'AGENT'.'TAAKMCNT';  >>$logfile
     db2 export to  $IXFLOC/TAAKMCNT.ixf of IXF messages $IXFLOC/TAAKMCNT.txt select  '*' FROM 'AGENT'.'TAAKMCNT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMCNT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMERR.ixf
rm -f $IXFLOC/TAAKMERR.txt
echo db2 export to  $IXFLOC/TAAKMERR.ixf of IXF messages $IXFLOC/TAAKMERR.txt select  '*' FROM 'AGENT'.'TAAKMERR';  >>$logfile
     db2 export to  $IXFLOC/TAAKMERR.ixf of IXF messages $IXFLOC/TAAKMERR.txt select  '*' FROM 'AGENT'.'TAAKMERR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMERR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMIFC.ixf
rm -f $IXFLOC/TAAKMIFC.txt
echo db2 export to  $IXFLOC/TAAKMIFC.ixf of IXF messages $IXFLOC/TAAKMIFC.txt select  '*' FROM 'AGENT'.'TAAKMIFC';  >>$logfile
     db2 export to  $IXFLOC/TAAKMIFC.ixf of IXF messages $IXFLOC/TAAKMIFC.txt select  '*' FROM 'AGENT'.'TAAKMIFC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMIFC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMIFM.ixf
rm -f $IXFLOC/TAAKMIFM.txt
echo db2 export to  $IXFLOC/TAAKMIFM.ixf of IXF messages $IXFLOC/TAAKMIFM.txt select  '*' FROM 'AGENT'.'TAAKMIFM';  >>$logfile
     db2 export to  $IXFLOC/TAAKMIFM.ixf of IXF messages $IXFLOC/TAAKMIFM.txt select  '*' FROM 'AGENT'.'TAAKMIFM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMIFM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMSTG.ixf
rm -f $IXFLOC/TAAKMSTG.txt
echo db2 export to  $IXFLOC/TAAKMSTG.ixf of IXF messages $IXFLOC/TAAKMSTG.txt select  '*' FROM 'AGENT'.'TAAKMSTG';  >>$logfile
     db2 export to  $IXFLOC/TAAKMSTG.ixf of IXF messages $IXFLOC/TAAKMSTG.txt select  '*' FROM 'AGENT'.'TAAKMSTG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMSTG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMSTL.ixf
rm -f $IXFLOC/TAAKMSTL.txt
echo db2 export to  $IXFLOC/TAAKMSTL.ixf of IXF messages $IXFLOC/TAAKMSTL.txt select  '*' FROM 'AGENT'.'TAAKMSTL';  >>$logfile
     db2 export to  $IXFLOC/TAAKMSTL.ixf of IXF messages $IXFLOC/TAAKMSTL.txt select  '*' FROM 'AGENT'.'TAAKMSTL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMSTL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMTRM.ixf
rm -f $IXFLOC/TAAKMTRM.txt
echo db2 export to  $IXFLOC/TAAKMTRM.ixf of IXF messages $IXFLOC/TAAKMTRM.txt select  '*' FROM 'AGENT'.'TAAKMTRM';  >>$logfile
     db2 export to  $IXFLOC/TAAKMTRM.ixf of IXF messages $IXFLOC/TAAKMTRM.txt select  '*' FROM 'AGENT'.'TAAKMTRM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMTRM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAKMUPD.ixf
rm -f $IXFLOC/TAAKMUPD.txt
echo db2 export to  $IXFLOC/TAAKMUPD.ixf of IXF messages $IXFLOC/TAAKMUPD.txt select  '*' FROM 'AGENT'.'TAAKMUPD';  >>$logfile
     db2 export to  $IXFLOC/TAAKMUPD.ixf of IXF messages $IXFLOC/TAAKMUPD.txt select  '*' FROM 'AGENT'.'TAAKMUPD';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAKMUPD.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAARATES.ixf
rm -f $IXFLOC/TAARATES.txt
echo db2 export to  $IXFLOC/TAARATES.ixf of IXF messages $IXFLOC/TAARATES.txt select  '*' FROM 'AGENT'.'TAARATES';  >>$logfile
     db2 export to  $IXFLOC/TAARATES.ixf of IXF messages $IXFLOC/TAARATES.txt select  '*' FROM 'AGENT'.'TAARATES';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAARATES.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAASISER.ixf
rm -f $IXFLOC/TAASISER.txt
echo db2 export to  $IXFLOC/TAASISER.ixf of IXF messages $IXFLOC/TAASISER.txt select  '*' FROM 'AGENT'.'TAASISER';  >>$logfile
     db2 export to  $IXFLOC/TAASISER.ixf of IXF messages $IXFLOC/TAASISER.txt select  '*' FROM 'AGENT'.'TAASISER';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAASISER.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAUTHPR.ixf
rm -f $IXFLOC/TAAUTHPR.txt
echo db2 export to  $IXFLOC/TAAUTHPR.ixf of IXF messages $IXFLOC/TAAUTHPR.txt select  '*' FROM 'AGENT'.'TAAUTHPR';  >>$logfile
     db2 export to  $IXFLOC/TAAUTHPR.ixf of IXF messages $IXFLOC/TAAUTHPR.txt select  '*' FROM 'AGENT'.'TAAUTHPR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAUTHPR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAAVBI.ixf
rm -f $IXFLOC/TAAVBI.txt
echo db2 export to  $IXFLOC/TAAVBI.ixf of IXF messages $IXFLOC/TAAVBI.txt select  '*' FROM 'AGENT'.'TAAVBI';  >>$logfile
     db2 export to  $IXFLOC/TAAVBI.ixf of IXF messages $IXFLOC/TAAVBI.txt select  '*' FROM 'AGENT'.'TAAVBI';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAAVBI.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TABENNAM.ixf
rm -f $IXFLOC/TABENNAM.txt
echo db2 export to  $IXFLOC/TABENNAM.ixf of IXF messages $IXFLOC/TABENNAM.txt select  '*' FROM 'CLIENT'.'TABENNAM';  >>$logfile
     db2 export to  $IXFLOC/TABENNAM.ixf of IXF messages $IXFLOC/TABENNAM.txt select  '*' FROM 'CLIENT'.'TABENNAM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TABENNAM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TABENNOM.ixf
rm -f $IXFLOC/TABENNOM.txt
echo db2 export to  $IXFLOC/TABENNOM.ixf of IXF messages $IXFLOC/TABENNOM.txt select  '*' FROM 'CLIENT'.'TABENNOM';  >>$logfile
     db2 export to  $IXFLOC/TABENNOM.ixf of IXF messages $IXFLOC/TABENNOM.txt select  '*' FROM 'CLIENT'.'TABENNOM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TABENNOM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TABLMAIL.ixf
rm -f $IXFLOC/TABLMAIL.txt
echo db2 export to  $IXFLOC/TABLMAIL.ixf of IXF messages $IXFLOC/TABLMAIL.txt select  '*' FROM 'AGENT'.'TABLMAIL';  >>$logfile
     db2 export to  $IXFLOC/TABLMAIL.ixf of IXF messages $IXFLOC/TABLMAIL.txt select  '*' FROM 'AGENT'.'TABLMAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TABLMAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TABSAMRL.ixf
rm -f $IXFLOC/TABSAMRL.txt
echo db2 export to  $IXFLOC/TABSAMRL.ixf of IXF messages $IXFLOC/TABSAMRL.txt select  '*' FROM 'CLIENT'.'TABSAMRL';  >>$logfile
     db2 export to  $IXFLOC/TABSAMRL.ixf of IXF messages $IXFLOC/TABSAMRL.txt select  '*' FROM 'CLIENT'.'TABSAMRL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TABSAMRL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLAERR.ixf
rm -f $IXFLOC/TACLAERR.txt
echo db2 export to  $IXFLOC/TACLAERR.ixf of IXF messages $IXFLOC/TACLAERR.txt select  '*' FROM 'RULES'.'TACLAERR';  >>$logfile
     db2 export to  $IXFLOC/TACLAERR.ixf of IXF messages $IXFLOC/TACLAERR.txt select  '*' FROM 'RULES'.'TACLAERR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAERR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLAGCP.ixf
rm -f $IXFLOC/TACLAGCP.txt
echo db2 export to  $IXFLOC/TACLAGCP.ixf of IXF messages $IXFLOC/TACLAGCP.txt select  '*' FROM 'CLIENT'.'TACLAGCP';  >>$logfile
     db2 export to  $IXFLOC/TACLAGCP.ixf of IXF messages $IXFLOC/TACLAGCP.txt select  '*' FROM 'CLIENT'.'TACLAGCP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAGCP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLAMSG.ixf
rm -f $IXFLOC/TACLAMSG.txt
echo db2 export to  $IXFLOC/TACLAMSG.ixf of IXF messages $IXFLOC/TACLAMSG.txt select  '*' FROM 'RULES'.'TACLAMSG';  >>$logfile
     db2 export to  $IXFLOC/TACLAMSG.ixf of IXF messages $IXFLOC/TACLAMSG.txt select  '*' FROM 'RULES'.'TACLAMSG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAMSG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLAPTY.ixf
rm -f $IXFLOC/TACLAPTY.txt
echo db2 export to  $IXFLOC/TACLAPTY.ixf of IXF messages $IXFLOC/TACLAPTY.txt select  '*' FROM 'RULES'.'TACLAPTY';  >>$logfile
     db2 export to  $IXFLOC/TACLAPTY.ixf of IXF messages $IXFLOC/TACLAPTY.txt select  '*' FROM 'RULES'.'TACLAPTY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAPTY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLAROL.ixf
rm -f $IXFLOC/TACLAROL.txt
echo db2 export to  $IXFLOC/TACLAROL.ixf of IXF messages $IXFLOC/TACLAROL.txt select  '*' FROM 'RULES'.'TACLAROL';  >>$logfile
     db2 export to  $IXFLOC/TACLAROL.ixf of IXF messages $IXFLOC/TACLAROL.txt select  '*' FROM 'RULES'.'TACLAROL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLAROL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLASPC.ixf
rm -f $IXFLOC/TACLASPC.txt
echo db2 export to  $IXFLOC/TACLASPC.ixf of IXF messages $IXFLOC/TACLASPC.txt select  '*' FROM 'RULES'.'TACLASPC';  >>$logfile
     db2 export to  $IXFLOC/TACLASPC.ixf of IXF messages $IXFLOC/TACLASPC.txt select  '*' FROM 'RULES'.'TACLASPC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASPC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLASRL.ixf
rm -f $IXFLOC/TACLASRL.txt
echo db2 export to  $IXFLOC/TACLASRL.ixf of IXF messages $IXFLOC/TACLASRL.txt select  '*' FROM 'RULES'.'TACLASRL';  >>$logfile
     db2 export to  $IXFLOC/TACLASRL.ixf of IXF messages $IXFLOC/TACLASRL.txt select  '*' FROM 'RULES'.'TACLASRL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASRL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLASSF.ixf
rm -f $IXFLOC/TACLASSF.txt
echo db2 export to  $IXFLOC/TACLASSF.ixf of IXF messages $IXFLOC/TACLASSF.txt select  '*' FROM 'RULES'.'TACLASSF';  >>$logfile
     db2 export to  $IXFLOC/TACLASSF.ixf of IXF messages $IXFLOC/TACLASSF.txt select  '*' FROM 'RULES'.'TACLASSF';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASSF.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLASTP.ixf
rm -f $IXFLOC/TACLASTP.txt
echo db2 export to  $IXFLOC/TACLASTP.ixf of IXF messages $IXFLOC/TACLASTP.txt select  '*' FROM 'RULES'.'TACLASTP';  >>$logfile
     db2 export to  $IXFLOC/TACLASTP.ixf of IXF messages $IXFLOC/TACLASTP.txt select  '*' FROM 'RULES'.'TACLASTP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLASTP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLIENT.ixf
rm -f $IXFLOC/TACLIENT.txt
echo db2 export to  $IXFLOC/TACLIENT.ixf of IXF messages $IXFLOC/TACLIENT.txt select  '*' FROM 'CLIENT'.'TACLIENT';  >>$logfile
     db2 export to  $IXFLOC/TACLIENT.ixf of IXF messages $IXFLOC/TACLIENT.txt select  '*' FROM 'CLIENT'.'TACLIENT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLIENT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLNTAC.ixf
rm -f $IXFLOC/TACLNTAC.txt
echo db2 export to  $IXFLOC/TACLNTAC.ixf of IXF messages $IXFLOC/TACLNTAC.txt select  '*' FROM 'CLIENT'.'TACLNTAC';  >>$logfile
     db2 export to  $IXFLOC/TACLNTAC.ixf of IXF messages $IXFLOC/TACLNTAC.txt select  '*' FROM 'CLIENT'.'TACLNTAC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTAC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLNTAG.ixf
rm -f $IXFLOC/TACLNTAG.txt
echo db2 export to  $IXFLOC/TACLNTAG.ixf of IXF messages $IXFLOC/TACLNTAG.txt select  '*' FROM 'CLIENT'.'TACLNTAG';  >>$logfile
     db2 export to  $IXFLOC/TACLNTAG.ixf of IXF messages $IXFLOC/TACLNTAG.txt select  '*' FROM 'CLIENT'.'TACLNTAG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTAG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLNTPL.ixf
rm -f $IXFLOC/TACLNTPL.txt
echo db2 export to  $IXFLOC/TACLNTPL.ixf of IXF messages $IXFLOC/TACLNTPL.txt select  '*' FROM 'CLIENT'.'TACLNTPL';  >>$logfile
     db2 export to  $IXFLOC/TACLNTPL.ixf of IXF messages $IXFLOC/TACLNTPL.txt select  '*' FROM 'CLIENT'.'TACLNTPL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLNTPL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTACT.ixf
rm -f $IXFLOC/TACLTACT.txt
echo db2 export to  $IXFLOC/TACLTACT.ixf of IXF messages $IXFLOC/TACLTACT.txt select  '*' FROM 'CLIENT'.'TACLTACT';  >>$logfile
     db2 export to  $IXFLOC/TACLTACT.ixf of IXF messages $IXFLOC/TACLTACT.txt select  '*' FROM 'CLIENT'.'TACLTACT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTACT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTCON.ixf
rm -f $IXFLOC/TACLTCON.txt
echo db2 export to  $IXFLOC/TACLTCON.ixf of IXF messages $IXFLOC/TACLTCON.txt select  '*' FROM 'CLIENT'.'TACLTCON';  >>$logfile
     db2 export to  $IXFLOC/TACLTCON.ixf of IXF messages $IXFLOC/TACLTCON.txt select  '*' FROM 'CLIENT'.'TACLTCON';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTCON.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTDET.ixf
rm -f $IXFLOC/TACLTDET.txt
echo db2 export to  $IXFLOC/TACLTDET.ixf of IXF messages $IXFLOC/TACLTDET.txt select  '*' FROM 'CLIENT'.'TACLTDET';  >>$logfile
     db2 export to  $IXFLOC/TACLTDET.ixf of IXF messages $IXFLOC/TACLTDET.txt select  '*' FROM 'CLIENT'.'TACLTDET';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTDET.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTOBJ.ixf
rm -f $IXFLOC/TACLTOBJ.txt
echo db2 export to  $IXFLOC/TACLTOBJ.ixf of IXF messages $IXFLOC/TACLTOBJ.txt select  '*' FROM 'CLIENT'.'TACLTOBJ';  >>$logfile
     db2 export to  $IXFLOC/TACLTOBJ.ixf of IXF messages $IXFLOC/TACLTOBJ.txt select  '*' FROM 'CLIENT'.'TACLTOBJ';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTOBJ.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTREG.ixf
rm -f $IXFLOC/TACLTREG.txt
echo db2 export to  $IXFLOC/TACLTREG.ixf of IXF messages $IXFLOC/TACLTREG.txt select  '*' FROM 'CLIENT'.'TACLTREG';  >>$logfile
     db2 export to  $IXFLOC/TACLTREG.ixf of IXF messages $IXFLOC/TACLTREG.txt select  '*' FROM 'CLIENT'.'TACLTREG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTREG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTREL.ixf
rm -f $IXFLOC/TACLTREL.txt
echo db2 export to  $IXFLOC/TACLTREL.ixf of IXF messages $IXFLOC/TACLTREL.txt select  '*' FROM 'CLIENT'.'TACLTREL';  >>$logfile
     db2 export to  $IXFLOC/TACLTREL.ixf of IXF messages $IXFLOC/TACLTREL.txt select  '*' FROM 'CLIENT'.'TACLTREL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTREL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTRUL.ixf
rm -f $IXFLOC/TACLTRUL.txt
echo db2 export to  $IXFLOC/TACLTRUL.ixf of IXF messages $IXFLOC/TACLTRUL.txt select  '*' FROM 'AGENT'.'TACLTRUL';  >>$logfile
     db2 export to  $IXFLOC/TACLTRUL.ixf of IXF messages $IXFLOC/TACLTRUL.txt select  '*' FROM 'AGENT'.'TACLTRUL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTRUL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTSPC.ixf
rm -f $IXFLOC/TACLTSPC.txt
echo db2 export to  $IXFLOC/TACLTSPC.ixf of IXF messages $IXFLOC/TACLTSPC.txt select  '*' FROM 'CLIENT'.'TACLTSPC';  >>$logfile
     db2 export to  $IXFLOC/TACLTSPC.ixf of IXF messages $IXFLOC/TACLTSPC.txt select  '*' FROM 'CLIENT'.'TACLTSPC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTSPC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACLTTFN.ixf
rm -f $IXFLOC/TACLTTFN.txt
echo db2 export to  $IXFLOC/TACLTTFN.ixf of IXF messages $IXFLOC/TACLTTFN.txt select  '*' FROM 'CLIENT'.'TACLTTFN';  >>$logfile
     db2 export to  $IXFLOC/TACLTTFN.ixf of IXF messages $IXFLOC/TACLTTFN.txt select  '*' FROM 'CLIENT'.'TACLTTFN';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACLTTFN.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACMSLNK.ixf
rm -f $IXFLOC/TACMSLNK.txt
echo db2 export to  $IXFLOC/TACMSLNK.ixf of IXF messages $IXFLOC/TACMSLNK.txt select  '*' FROM 'CLIENT'.'TACMSLNK';  >>$logfile
     db2 export to  $IXFLOC/TACMSLNK.ixf of IXF messages $IXFLOC/TACMSLNK.txt select  '*' FROM 'CLIENT'.'TACMSLNK';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACMSLNK.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACONTDT.ixf
rm -f $IXFLOC/TACONTDT.txt
echo db2 export to  $IXFLOC/TACONTDT.ixf of IXF messages $IXFLOC/TACONTDT.txt select  '*' FROM 'CLIENT'.'TACONTDT';  >>$logfile
     db2 export to  $IXFLOC/TACONTDT.ixf of IXF messages $IXFLOC/TACONTDT.txt select  '*' FROM 'CLIENT'.'TACONTDT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACONTDT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACONTHD.ixf
rm -f $IXFLOC/TACONTHD.txt
echo db2 export to  $IXFLOC/TACONTHD.ixf of IXF messages $IXFLOC/TACONTHD.txt select  '*' FROM 'CLIENT'.'TACONTHD';  >>$logfile
     db2 export to  $IXFLOC/TACONTHD.ixf of IXF messages $IXFLOC/TACONTHD.txt select  '*' FROM 'CLIENT'.'TACONTHD';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACONTHD.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACONVEN.ixf
rm -f $IXFLOC/TACONVEN.txt
echo db2 export to  $IXFLOC/TACONVEN.ixf of IXF messages $IXFLOC/TACONVEN.txt select  '*' FROM 'AGENT'.'TACONVEN';  >>$logfile
     db2 export to  $IXFLOC/TACONVEN.ixf of IXF messages $IXFLOC/TACONVEN.txt select  '*' FROM 'AGENT'.'TACONVEN';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACONVEN.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACPCLRG.ixf
rm -f $IXFLOC/TACPCLRG.txt
echo db2 export to  $IXFLOC/TACPCLRG.ixf of IXF messages $IXFLOC/TACPCLRG.txt select  '*' FROM 'CLIENT'.'TACPCLRG';  >>$logfile
     db2 export to  $IXFLOC/TACPCLRG.ixf of IXF messages $IXFLOC/TACPCLRG.txt select  '*' FROM 'CLIENT'.'TACPCLRG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACPCLRG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TACUSTPR.ixf
rm -f $IXFLOC/TACUSTPR.txt
echo db2 export to  $IXFLOC/TACUSTPR.ixf of IXF messages $IXFLOC/TACUSTPR.txt select  '*' FROM 'AGENT'.'TACUSTPR';  >>$logfile
     db2 export to  $IXFLOC/TACUSTPR.ixf of IXF messages $IXFLOC/TACUSTPR.txt select  '*' FROM 'AGENT'.'TACUSTPR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TACUSTPR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TADAFEED.ixf
rm -f $IXFLOC/TADAFEED.txt
echo db2 export to  $IXFLOC/TADAFEED.ixf of IXF messages $IXFLOC/TADAFEED.txt select  '*' FROM 'AGENT'.'TADAFEED';  >>$logfile
     db2 export to  $IXFLOC/TADAFEED.ixf of IXF messages $IXFLOC/TADAFEED.txt select  '*' FROM 'AGENT'.'TADAFEED';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TADAFEED.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TADEFFAC.ixf
rm -f $IXFLOC/TADEFFAC.txt
echo db2 export to  $IXFLOC/TADEFFAC.ixf of IXF messages $IXFLOC/TADEFFAC.txt select  '*' FROM 'CLIENT'.'TADEFFAC';  >>$logfile
     db2 export to  $IXFLOC/TADEFFAC.ixf of IXF messages $IXFLOC/TADEFFAC.txt select  '*' FROM 'CLIENT'.'TADEFFAC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TADEFFAC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TADISCNT.ixf
rm -f $IXFLOC/TADISCNT.txt
echo db2 export to  $IXFLOC/TADISCNT.ixf of IXF messages $IXFLOC/TADISCNT.txt select  '*' FROM 'AGENT'.'TADISCNT';  >>$logfile
     db2 export to  $IXFLOC/TADISCNT.ixf of IXF messages $IXFLOC/TADISCNT.txt select  '*' FROM 'AGENT'.'TADISCNT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TADISCNT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TADUMMY.ixf
rm -f $IXFLOC/TADUMMY.txt
echo db2 export to  $IXFLOC/TADUMMY.ixf of IXF messages $IXFLOC/TADUMMY.txt select  '*' FROM 'CLIENT'.'TADUMMY';  >>$logfile
     db2 export to  $IXFLOC/TADUMMY.ixf of IXF messages $IXFLOC/TADUMMY.txt select  '*' FROM 'CLIENT'.'TADUMMY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TADUMMY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TADUMMY.ixf
rm -f $IXFLOC/TADUMMY.txt
echo db2 export to  $IXFLOC/TADUMMY.ixf of IXF messages $IXFLOC/TADUMMY.txt select  '*' FROM 'UTILITY'.'TADUMMY';  >>$logfile
     db2 export to  $IXFLOC/TADUMMY.ixf of IXF messages $IXFLOC/TADUMMY.txt select  '*' FROM 'UTILITY'.'TADUMMY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TADUMMY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAEMAIL.ixf
rm -f $IXFLOC/TAEMAIL.txt
echo db2 export to  $IXFLOC/TAEMAIL.ixf of IXF messages $IXFLOC/TAEMAIL.txt select  '*' FROM 'AGENT'.'TAEMAIL';  >>$logfile
     db2 export to  $IXFLOC/TAEMAIL.ixf of IXF messages $IXFLOC/TAEMAIL.txt select  '*' FROM 'AGENT'.'TAEMAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAEMAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAEMLDAT.ixf
rm -f $IXFLOC/TAEMLDAT.txt
echo db2 export to  $IXFLOC/TAEMLDAT.ixf of IXF messages $IXFLOC/TAEMLDAT.txt select  '*' FROM 'AGENT'.'TAEMLDAT';  >>$logfile
     db2 export to  $IXFLOC/TAEMLDAT.ixf of IXF messages $IXFLOC/TAEMLDAT.txt select  '*' FROM 'AGENT'.'TAEMLDAT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAEMLDAT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAERRMSG.ixf
rm -f $IXFLOC/TAERRMSG.txt
echo db2 export to  $IXFLOC/TAERRMSG.ixf of IXF messages $IXFLOC/TAERRMSG.txt select  '*' FROM 'RULES'.'TAERRMSG';  >>$logfile
     db2 export to  $IXFLOC/TAERRMSG.ixf of IXF messages $IXFLOC/TAERRMSG.txt select  '*' FROM 'RULES'.'TAERRMSG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRMSG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAERRORS.ixf
rm -f $IXFLOC/TAERRORS.txt
echo db2 export to  $IXFLOC/TAERRORS.ixf of IXF messages $IXFLOC/TAERRORS.txt select  '*' FROM 'UTILITY'.'TAERRORS';  >>$logfile
     db2 export to  $IXFLOC/TAERRORS.ixf of IXF messages $IXFLOC/TAERRORS.txt select  '*' FROM 'UTILITY'.'TAERRORS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRORS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAERRTYP.ixf
rm -f $IXFLOC/TAERRTYP.txt
echo db2 export to  $IXFLOC/TAERRTYP.ixf of IXF messages $IXFLOC/TAERRTYP.txt select  '*' FROM 'RULES'.'TAERRTYP';  >>$logfile
     db2 export to  $IXFLOC/TAERRTYP.ixf of IXF messages $IXFLOC/TAERRTYP.txt select  '*' FROM 'RULES'.'TAERRTYP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAERRTYP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAFAD.ixf
rm -f $IXFLOC/TAFAD.txt
echo db2 export to  $IXFLOC/TAFAD.ixf of IXF messages $IXFLOC/TAFAD.txt select  '*' FROM 'CLIENT'.'TAFAD';  >>$logfile
     db2 export to  $IXFLOC/TAFAD.ixf of IXF messages $IXFLOC/TAFAD.txt select  '*' FROM 'CLIENT'.'TAFAD';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAFAD.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAFSY.ixf
rm -f $IXFLOC/TAFSY.txt
echo db2 export to  $IXFLOC/TAFSY.ixf of IXF messages $IXFLOC/TAFSY.txt select  '*' FROM 'UTILITY'.'TAFSY';  >>$logfile
     db2 export to  $IXFLOC/TAFSY.ixf of IXF messages $IXFLOC/TAFSY.txt select  '*' FROM 'UTILITY'.'TAFSY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAFSY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAGNTCOM.ixf
rm -f $IXFLOC/TAGNTCOM.txt
echo db2 export to  $IXFLOC/TAGNTCOM.ixf of IXF messages $IXFLOC/TAGNTCOM.txt select  '*' FROM 'AGENT'.'TAGNTCOM';  >>$logfile
     db2 export to  $IXFLOC/TAGNTCOM.ixf of IXF messages $IXFLOC/TAGNTCOM.txt select  '*' FROM 'AGENT'.'TAGNTCOM';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAGNTCOM.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAGPAYBL.ixf
rm -f $IXFLOC/TAGPAYBL.txt
echo db2 export to  $IXFLOC/TAGPAYBL.ixf of IXF messages $IXFLOC/TAGPAYBL.txt select  '*' FROM 'AGENT'.'TAGPAYBL';  >>$logfile
     db2 export to  $IXFLOC/TAGPAYBL.ixf of IXF messages $IXFLOC/TAGPAYBL.txt select  '*' FROM 'AGENT'.'TAGPAYBL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAGPAYBL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAKAMACT.ixf
rm -f $IXFLOC/TAKAMACT.txt
echo db2 export to  $IXFLOC/TAKAMACT.ixf of IXF messages $IXFLOC/TAKAMACT.txt select  '*' FROM 'AGENT'.'TAKAMACT';  >>$logfile
     db2 export to  $IXFLOC/TAKAMACT.ixf of IXF messages $IXFLOC/TAKAMACT.txt select  '*' FROM 'AGENT'.'TAKAMACT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAKAMACT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAMESRUL.ixf
rm -f $IXFLOC/TAMESRUL.txt
echo db2 export to  $IXFLOC/TAMESRUL.ixf of IXF messages $IXFLOC/TAMESRUL.txt select  '*' FROM 'SUPER'.'TAMESRUL';  >>$logfile
     db2 export to  $IXFLOC/TAMESRUL.ixf of IXF messages $IXFLOC/TAMESRUL.txt select  '*' FROM 'SUPER'.'TAMESRUL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESRUL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAMESTGP.ixf
rm -f $IXFLOC/TAMESTGP.txt
echo db2 export to  $IXFLOC/TAMESTGP.ixf of IXF messages $IXFLOC/TAMESTGP.txt select  '*' FROM 'SUPER'.'TAMESTGP';  >>$logfile
     db2 export to  $IXFLOC/TAMESTGP.ixf of IXF messages $IXFLOC/TAMESTGP.txt select  '*' FROM 'SUPER'.'TAMESTGP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESTGP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAMESTXN.ixf
rm -f $IXFLOC/TAMESTXN.txt
echo db2 export to  $IXFLOC/TAMESTXN.ixf of IXF messages $IXFLOC/TAMESTXN.txt select  '*' FROM 'SUPER'.'TAMESTXN';  >>$logfile
     db2 export to  $IXFLOC/TAMESTXN.ixf of IXF messages $IXFLOC/TAMESTXN.txt select  '*' FROM 'SUPER'.'TAMESTXN';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAMESTXN.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANAMAGR.ixf
rm -f $IXFLOC/TANAMAGR.txt
echo db2 export to  $IXFLOC/TANAMAGR.ixf of IXF messages $IXFLOC/TANAMAGR.txt select  '*' FROM 'CLIENT'.'TANAMAGR';  >>$logfile
     db2 export to  $IXFLOC/TANAMAGR.ixf of IXF messages $IXFLOC/TANAMAGR.txt select  '*' FROM 'CLIENT'.'TANAMAGR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMAGR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANAMCOY.ixf
rm -f $IXFLOC/TANAMCOY.txt
echo db2 export to  $IXFLOC/TANAMCOY.ixf of IXF messages $IXFLOC/TANAMCOY.txt select  '*' FROM 'CLIENT'.'TANAMCOY';  >>$logfile
     db2 export to  $IXFLOC/TANAMCOY.ixf of IXF messages $IXFLOC/TANAMCOY.txt select  '*' FROM 'CLIENT'.'TANAMCOY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMCOY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANAME.ixf
rm -f $IXFLOC/TANAME.txt
echo db2 export to  $IXFLOC/TANAME.ixf of IXF messages $IXFLOC/TANAME.txt select  '*' FROM 'CLIENT'.'TANAME';  >>$logfile
     db2 export to  $IXFLOC/TANAME.ixf of IXF messages $IXFLOC/TANAME.txt select  '*' FROM 'CLIENT'.'TANAME';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANAME.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANAMREG.ixf
rm -f $IXFLOC/TANAMREG.txt
echo db2 export to  $IXFLOC/TANAMREG.ixf of IXF messages $IXFLOC/TANAMREG.txt select  '*' FROM 'CLIENT'.'TANAMREG';  >>$logfile
     db2 export to  $IXFLOC/TANAMREG.ixf of IXF messages $IXFLOC/TANAMREG.txt select  '*' FROM 'CLIENT'.'TANAMREG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANAMREG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANEXTNO.ixf
rm -f $IXFLOC/TANEXTNO.txt
echo db2 export to  $IXFLOC/TANEXTNO.ixf of IXF messages $IXFLOC/TANEXTNO.txt select  '*' FROM 'UTILITY'.'TANEXTNO';  >>$logfile
     db2 export to  $IXFLOC/TANEXTNO.ixf of IXF messages $IXFLOC/TANEXTNO.txt select  '*' FROM 'UTILITY'.'TANEXTNO';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANEXTNO.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TANOTES.ixf
rm -f $IXFLOC/TANOTES.txt
echo db2 export to  $IXFLOC/TANOTES.ixf of IXF messages $IXFLOC/TANOTES.txt select  '*' FROM 'AGENT'.'TANOTES';  >>$logfile
     db2 export to  $IXFLOC/TANOTES.ixf of IXF messages $IXFLOC/TANOTES.txt select  '*' FROM 'AGENT'.'TANOTES';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TANOTES.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOACTRG.ixf
rm -f $IXFLOC/TAOACTRG.txt
echo db2 export to  $IXFLOC/TAOACTRG.ixf of IXF messages $IXFLOC/TAOACTRG.txt select  '*' FROM 'CLIENT'.'TAOACTRG';  >>$logfile
     db2 export to  $IXFLOC/TAOACTRG.ixf of IXF messages $IXFLOC/TAOACTRG.txt select  '*' FROM 'CLIENT'.'TAOACTRG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOACTRG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJAGR.ixf
rm -f $IXFLOC/TAOBJAGR.txt
echo db2 export to  $IXFLOC/TAOBJAGR.ixf of IXF messages $IXFLOC/TAOBJAGR.txt select  '*' FROM 'CLIENT'.'TAOBJAGR';  >>$logfile
     db2 export to  $IXFLOC/TAOBJAGR.ixf of IXF messages $IXFLOC/TAOBJAGR.txt select  '*' FROM 'CLIENT'.'TAOBJAGR';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJAGR.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJECT.ixf
rm -f $IXFLOC/TAOBJECT.txt
echo db2 export to  $IXFLOC/TAOBJECT.ixf of IXF messages $IXFLOC/TAOBJECT.txt select  '*' FROM 'CLIENT'.'TAOBJECT';  >>$logfile
     db2 export to  $IXFLOC/TAOBJECT.ixf of IXF messages $IXFLOC/TAOBJECT.txt select  '*' FROM 'CLIENT'.'TAOBJECT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJECT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJSTE.ixf
rm -f $IXFLOC/TAOBJSTE.txt
echo db2 export to  $IXFLOC/TAOBJSTE.ixf of IXF messages $IXFLOC/TAOBJSTE.txt select  '*' FROM 'CLIENT'.'TAOBJSTE';  >>$logfile
     db2 export to  $IXFLOC/TAOBJSTE.ixf of IXF messages $IXFLOC/TAOBJSTE.txt select  '*' FROM 'CLIENT'.'TAOBJSTE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJSTE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJTAC.ixf
rm -f $IXFLOC/TAOBJTAC.txt
echo db2 export to  $IXFLOC/TAOBJTAC.ixf of IXF messages $IXFLOC/TAOBJTAC.txt select  '*' FROM 'CLIENT'.'TAOBJTAC';  >>$logfile
     db2 export to  $IXFLOC/TAOBJTAC.ixf of IXF messages $IXFLOC/TAOBJTAC.txt select  '*' FROM 'CLIENT'.'TAOBJTAC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTAC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJTRG.ixf
rm -f $IXFLOC/TAOBJTRG.txt
echo db2 export to  $IXFLOC/TAOBJTRG.ixf of IXF messages $IXFLOC/TAOBJTRG.txt select  '*' FROM 'CLIENT'.'TAOBJTRG';  >>$logfile
     db2 export to  $IXFLOC/TAOBJTRG.ixf of IXF messages $IXFLOC/TAOBJTRG.txt select  '*' FROM 'CLIENT'.'TAOBJTRG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTRG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOBJTRL.ixf
rm -f $IXFLOC/TAOBJTRL.txt
echo db2 export to  $IXFLOC/TAOBJTRL.ixf of IXF messages $IXFLOC/TAOBJTRL.txt select  '*' FROM 'CLIENT'.'TAOBJTRL';  >>$logfile
     db2 export to  $IXFLOC/TAOBJTRL.ixf of IXF messages $IXFLOC/TAOBJTRL.txt select  '*' FROM 'CLIENT'.'TAOBJTRL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOBJTRL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAOFFICE.ixf
rm -f $IXFLOC/TAOFFICE.txt
echo db2 export to  $IXFLOC/TAOFFICE.ixf of IXF messages $IXFLOC/TAOFFICE.txt select  '*' FROM 'AGENT'.'TAOFFICE';  >>$logfile
     db2 export to  $IXFLOC/TAOFFICE.ixf of IXF messages $IXFLOC/TAOFFICE.txt select  '*' FROM 'AGENT'.'TAOFFICE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAOFFICE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAORLREG.ixf
rm -f $IXFLOC/TAORLREG.txt
echo db2 export to  $IXFLOC/TAORLREG.ixf of IXF messages $IXFLOC/TAORLREG.txt select  '*' FROM 'CLIENT'.'TAORLREG';  >>$logfile
     db2 export to  $IXFLOC/TAORLREG.ixf of IXF messages $IXFLOC/TAORLREG.txt select  '*' FROM 'CLIENT'.'TAORLREG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAORLREG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPLACE.ixf
rm -f $IXFLOC/TAPLACE.txt
echo db2 export to  $IXFLOC/TAPLACE.ixf of IXF messages $IXFLOC/TAPLACE.txt select  '*' FROM 'CLIENT'.'TAPLACE';  >>$logfile
     db2 export to  $IXFLOC/TAPLACE.ixf of IXF messages $IXFLOC/TAPLACE.txt select  '*' FROM 'CLIENT'.'TAPLACE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLACE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPLCECP.ixf
rm -f $IXFLOC/TAPLCECP.txt
echo db2 export to  $IXFLOC/TAPLCECP.ixf of IXF messages $IXFLOC/TAPLCECP.txt select  '*' FROM 'CLIENT'.'TAPLCECP';  >>$logfile
     db2 export to  $IXFLOC/TAPLCECP.ixf of IXF messages $IXFLOC/TAPLCECP.txt select  '*' FROM 'CLIENT'.'TAPLCECP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCECP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPLCLAB.ixf
rm -f $IXFLOC/TAPLCLAB.txt
echo db2 export to  $IXFLOC/TAPLCLAB.ixf of IXF messages $IXFLOC/TAPLCLAB.txt select  '*' FROM 'CLIENT'.'TAPLCLAB';  >>$logfile
     db2 export to  $IXFLOC/TAPLCLAB.ixf of IXF messages $IXFLOC/TAPLCLAB.txt select  '*' FROM 'CLIENT'.'TAPLCLAB';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCLAB.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPLCREL.ixf
rm -f $IXFLOC/TAPLCREL.txt
echo db2 export to  $IXFLOC/TAPLCREL.ixf of IXF messages $IXFLOC/TAPLCREL.txt select  '*' FROM 'CLIENT'.'TAPLCREL';  >>$logfile
     db2 export to  $IXFLOC/TAPLCREL.ixf of IXF messages $IXFLOC/TAPLCREL.txt select  '*' FROM 'CLIENT'.'TAPLCREL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPLCREL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPOLEXT.ixf
rm -f $IXFLOC/TAPOLEXT.txt
echo db2 export to  $IXFLOC/TAPOLEXT.ixf of IXF messages $IXFLOC/TAPOLEXT.txt select  '*' FROM 'CLIENT'.'TAPOLEXT';  >>$logfile
     db2 export to  $IXFLOC/TAPOLEXT.ixf of IXF messages $IXFLOC/TAPOLEXT.txt select  '*' FROM 'CLIENT'.'TAPOLEXT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPOLEXT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPROCTL.ixf
rm -f $IXFLOC/TAPROCTL.txt
echo db2 export to  $IXFLOC/TAPROCTL.ixf of IXF messages $IXFLOC/TAPROCTL.txt select  '*' FROM 'UTILITY'.'TAPROCTL';  >>$logfile
     db2 export to  $IXFLOC/TAPROCTL.ixf of IXF messages $IXFLOC/TAPROCTL.txt select  '*' FROM 'UTILITY'.'TAPROCTL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPROCTL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAPROPTY.ixf
rm -f $IXFLOC/TAPROPTY.txt
echo db2 export to  $IXFLOC/TAPROPTY.ixf of IXF messages $IXFLOC/TAPROPTY.txt select  '*' FROM 'RULES'.'TAPROPTY';  >>$logfile
     db2 export to  $IXFLOC/TAPROPTY.ixf of IXF messages $IXFLOC/TAPROPTY.txt select  '*' FROM 'RULES'.'TAPROPTY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAPROPTY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAREGIST.ixf
rm -f $IXFLOC/TAREGIST.txt
echo db2 export to  $IXFLOC/TAREGIST.ixf of IXF messages $IXFLOC/TAREGIST.txt select  '*' FROM 'CLIENT'.'TAREGIST';  >>$logfile
     db2 export to  $IXFLOC/TAREGIST.ixf of IXF messages $IXFLOC/TAREGIST.txt select  '*' FROM 'CLIENT'.'TAREGIST';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAREGIST.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TARELDET.ixf
rm -f $IXFLOC/TARELDET.txt
echo db2 export to  $IXFLOC/TARELDET.ixf of IXF messages $IXFLOC/TARELDET.txt select  '*' FROM 'AGENT'.'TARELDET';  >>$logfile
     db2 export to  $IXFLOC/TARELDET.ixf of IXF messages $IXFLOC/TARELDET.txt select  '*' FROM 'AGENT'.'TARELDET';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TARELDET.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAROLETP.ixf
rm -f $IXFLOC/TAROLETP.txt
echo db2 export to  $IXFLOC/TAROLETP.ixf of IXF messages $IXFLOC/TAROLETP.txt select  '*' FROM 'RULES'.'TAROLETP';  >>$logfile
     db2 export to  $IXFLOC/TAROLETP.ixf of IXF messages $IXFLOC/TAROLETP.txt select  '*' FROM 'RULES'.'TAROLETP';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAROLETP.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TARPTDLY.ixf
rm -f $IXFLOC/TARPTDLY.txt
echo db2 export to  $IXFLOC/TARPTDLY.ixf of IXF messages $IXFLOC/TARPTDLY.txt select  '*' FROM 'AGENT'.'TARPTDLY';  >>$logfile
     db2 export to  $IXFLOC/TARPTDLY.ixf of IXF messages $IXFLOC/TARPTDLY.txt select  '*' FROM 'AGENT'.'TARPTDLY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TARPTDLY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TARSTART.ixf
rm -f $IXFLOC/TARSTART.txt
echo db2 export to  $IXFLOC/TARSTART.ixf of IXF messages $IXFLOC/TARSTART.txt select  '*' FROM 'UTILITY'.'TARSTART';  >>$logfile
     db2 export to  $IXFLOC/TARSTART.ixf of IXF messages $IXFLOC/TARSTART.txt select  '*' FROM 'UTILITY'.'TARSTART';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TARSTART.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASECURE.ixf
rm -f $IXFLOC/TASECURE.txt
echo db2 export to  $IXFLOC/TASECURE.ixf of IXF messages $IXFLOC/TASECURE.txt select  '*' FROM 'AGENT'.'TASECURE';  >>$logfile
     db2 export to  $IXFLOC/TASECURE.ixf of IXF messages $IXFLOC/TASECURE.txt select  '*' FROM 'AGENT'.'TASECURE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASECURE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASPECIF.ixf
rm -f $IXFLOC/TASPECIF.txt
echo db2 export to  $IXFLOC/TASPECIF.ixf of IXF messages $IXFLOC/TASPECIF.txt select  '*' FROM 'RULES'.'TASPECIF';  >>$logfile
     db2 export to  $IXFLOC/TASPECIF.ixf of IXF messages $IXFLOC/TASPECIF.txt select  '*' FROM 'RULES'.'TASPECIF';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASPECIF.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASPECRL.ixf
rm -f $IXFLOC/TASPECRL.txt
echo db2 export to  $IXFLOC/TASPECRL.ixf of IXF messages $IXFLOC/TASPECRL.txt select  '*' FROM 'RULES'.'TASPECRL';  >>$logfile
     db2 export to  $IXFLOC/TASPECRL.ixf of IXF messages $IXFLOC/TASPECRL.txt select  '*' FROM 'RULES'.'TASPECRL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASPECRL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASQLTXT.ixf
rm -f $IXFLOC/TASQLTXT.txt
echo db2 export to  $IXFLOC/TASQLTXT.ixf of IXF messages $IXFLOC/TASQLTXT.txt select  '*' FROM 'AGENT'.'TASQLTXT';  >>$logfile
     db2 export to  $IXFLOC/TASQLTXT.ixf of IXF messages $IXFLOC/TASQLTXT.txt select  '*' FROM 'AGENT'.'TASQLTXT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASQLTXT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTEREG.ixf
rm -f $IXFLOC/TASTEREG.txt
echo db2 export to  $IXFLOC/TASTEREG.ixf of IXF messages $IXFLOC/TASTEREG.txt select  '*' FROM 'CLIENT'.'TASTEREG';  >>$logfile
     db2 export to  $IXFLOC/TASTEREG.ixf of IXF messages $IXFLOC/TASTEREG.txt select  '*' FROM 'CLIENT'.'TASTEREG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTEREG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTD2.ixf
rm -f $IXFLOC/TASTMTD2.txt
echo db2 export to  $IXFLOC/TASTMTD2.ixf of IXF messages $IXFLOC/TASTMTD2.txt select  '*' FROM 'AGENT'.'TASTMTD2';  >>$logfile
     db2 export to  $IXFLOC/TASTMTD2.ixf of IXF messages $IXFLOC/TASTMTD2.txt select  '*' FROM 'AGENT'.'TASTMTD2';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTD2.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTDT.ixf
rm -f $IXFLOC/TASTMTDT.txt
echo db2 export to  $IXFLOC/TASTMTDT.ixf of IXF messages $IXFLOC/TASTMTDT.txt select  '*' FROM 'AGENT'.'TASTMTDT';  >>$logfile
     db2 export to  $IXFLOC/TASTMTDT.ixf of IXF messages $IXFLOC/TASTMTDT.txt select  '*' FROM 'AGENT'.'TASTMTDT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTDT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTHD.ixf
rm -f $IXFLOC/TASTMTHD.txt
echo db2 export to  $IXFLOC/TASTMTHD.ixf of IXF messages $IXFLOC/TASTMTHD.txt select  '*' FROM 'AGENT'.'TASTMTHD';  >>$logfile
     db2 export to  $IXFLOC/TASTMTHD.ixf of IXF messages $IXFLOC/TASTMTHD.txt select  '*' FROM 'AGENT'.'TASTMTHD';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTHD.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTHS.ixf
rm -f $IXFLOC/TASTMTHS.txt
echo db2 export to  $IXFLOC/TASTMTHS.ixf of IXF messages $IXFLOC/TASTMTHS.txt select  '*' FROM 'AGENT'.'TASTMTHS';  >>$logfile
     db2 export to  $IXFLOC/TASTMTHS.ixf of IXF messages $IXFLOC/TASTMTHS.txt select  '*' FROM 'AGENT'.'TASTMTHS';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTHS.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTLG.ixf
rm -f $IXFLOC/TASTMTLG.txt
echo db2 export to  $IXFLOC/TASTMTLG.ixf of IXF messages $IXFLOC/TASTMTLG.txt select  '*' FROM 'AGENT'.'TASTMTLG';  >>$logfile
     db2 export to  $IXFLOC/TASTMTLG.ixf of IXF messages $IXFLOC/TASTMTLG.txt select  '*' FROM 'AGENT'.'TASTMTLG';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTLG.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TASTMTNA.ixf
rm -f $IXFLOC/TASTMTNA.txt
echo db2 export to  $IXFLOC/TASTMTNA.ixf of IXF messages $IXFLOC/TASTMTNA.txt select  '*' FROM 'AGENT'.'TASTMTNA';  >>$logfile
     db2 export to  $IXFLOC/TASTMTNA.ixf of IXF messages $IXFLOC/TASTMTNA.txt select  '*' FROM 'AGENT'.'TASTMTNA';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TASTMTNA.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TATRADE.ixf
rm -f $IXFLOC/TATRADE.txt
echo db2 export to  $IXFLOC/TATRADE.ixf of IXF messages $IXFLOC/TATRADE.txt select  '*' FROM 'SUPER'.'TATRADE';  >>$logfile
     db2 export to  $IXFLOC/TATRADE.ixf of IXF messages $IXFLOC/TATRADE.txt select  '*' FROM 'SUPER'.'TATRADE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TATRADE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TATYPE.ixf
rm -f $IXFLOC/TATYPE.txt
echo db2 export to  $IXFLOC/TATYPE.ixf of IXF messages $IXFLOC/TATYPE.txt select  '*' FROM 'RULES'.'TATYPE';  >>$logfile
     db2 export to  $IXFLOC/TATYPE.ixf of IXF messages $IXFLOC/TATYPE.txt select  '*' FROM 'RULES'.'TATYPE';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TATYPE.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAWELLET.ixf
rm -f $IXFLOC/TAWELLET.txt
echo db2 export to  $IXFLOC/TAWELLET.ixf of IXF messages $IXFLOC/TAWELLET.txt select  '*' FROM 'AGENT'.'TAWELLET';  >>$logfile
     db2 export to  $IXFLOC/TAWELLET.ixf of IXF messages $IXFLOC/TAWELLET.txt select  '*' FROM 'AGENT'.'TAWELLET';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAWELLET.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAWLMAIL.ixf
rm -f $IXFLOC/TAWLMAIL.txt
echo db2 export to  $IXFLOC/TAWLMAIL.ixf of IXF messages $IXFLOC/TAWLMAIL.txt select  '*' FROM 'AGENT'.'TAWLMAIL';  >>$logfile
     db2 export to  $IXFLOC/TAWLMAIL.ixf of IXF messages $IXFLOC/TAWLMAIL.txt select  '*' FROM 'AGENT'.'TAWLMAIL';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLMAIL.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAWLPTXT.ixf
rm -f $IXFLOC/TAWLPTXT.txt
echo db2 export to  $IXFLOC/TAWLPTXT.ixf of IXF messages $IXFLOC/TAWLPTXT.txt select  '*' FROM 'AGENT'.'TAWLPTXT';  >>$logfile
     db2 export to  $IXFLOC/TAWLPTXT.ixf of IXF messages $IXFLOC/TAWLPTXT.txt select  '*' FROM 'AGENT'.'TAWLPTXT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLPTXT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAWLTPLT.ixf
rm -f $IXFLOC/TAWLTPLT.txt
echo db2 export to  $IXFLOC/TAWLTPLT.ixf of IXF messages $IXFLOC/TAWLTPLT.txt select  '*' FROM 'AGENT'.'TAWLTPLT';  >>$logfile
     db2 export to  $IXFLOC/TAWLTPLT.ixf of IXF messages $IXFLOC/TAWLTPLT.txt select  '*' FROM 'AGENT'.'TAWLTPLT';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAWLTPLT.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TAYRSFAC.ixf
rm -f $IXFLOC/TAYRSFAC.txt
echo db2 export to  $IXFLOC/TAYRSFAC.ixf of IXF messages $IXFLOC/TAYRSFAC.txt select  '*' FROM 'CLIENT'.'TAYRSFAC';  >>$logfile
     db2 export to  $IXFLOC/TAYRSFAC.ixf of IXF messages $IXFLOC/TAYRSFAC.txt select  '*' FROM 'CLIENT'.'TAYRSFAC';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TAYRSFAC.txt >>$logfile
  echo  '#** **'   >>$logfile
 

rm -f $IXFLOC/TEMPPOLICY.ixf
rm -f $IXFLOC/TEMPPOLICY.txt
echo db2 export to  $IXFLOC/TEMPPOLICY.ixf of IXF messages $IXFLOC/TEMPPOLICY.txt select  '*' FROM 'AGENT'.'TEMPPOLICY';  >>$logfile
     db2 export to  $IXFLOC/TEMPPOLICY.ixf of IXF messages $IXFLOC/TEMPPOLICY.txt select  '*' FROM 'AGENT'.'TEMPPOLICY';
  echo  '#** **'   >>$logfile
cat $IXFLOC/TEMPPOLICY.txt >>$logfile
  echo  '#** **'   >>$logfile
 

cat $logfile
exit