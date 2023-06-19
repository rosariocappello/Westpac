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

logfile=$ENVTOP/logs/db2_check_cont.log
export logfile

rm -f $logfile
             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
  
db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD >>$logfile

db2 select tabschema, tabname, substr\(const_checked,1,1\) as pk_check, substr\(const_checked,2,1\) as cc_check from syscat.tables  where status = 'C'
pause


echo db2 set constraints for 'AGENT'.'ADMINCNF' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADMINCNF' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'ADOSTAG2' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'ADOSTAG2' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'ADOSTAGE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'ADOSTAGE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'ADVADCNF' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADVADCNF' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'ADVAPADM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADVAPADM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'ADVIMPLG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADVIMPLG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_INDEX' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_INDEX' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_INSTANCE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_INSTANCE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_MQT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_MQT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_PARTITION' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_PARTITION' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_TABLE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_TABLE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'ADVISE_WORKLOAD' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'ADVISE_WORKLOAD' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'ADVSTAG2' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADVSTAG2' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'ADVSTAGE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'ADVSTAGE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_ACTUALS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_ACTUALS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_ARGUMENT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_ARGUMENT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_ARGUMENT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_ARGUMENT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_DIAGNOSTIC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_DIAGNOSTIC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_INSTANCE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_INSTANCE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_INSTANCE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_INSTANCE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_OBJECT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_OBJECT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_OBJECT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_OBJECT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_OPERATOR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_OPERATOR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_OPERATOR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_OPERATOR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_PREDICATE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_PREDICATE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_PREDICATE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_PREDICATE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_STATEMENT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_STATEMENT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_STATEMENT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_STATEMENT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2TESTER'.'EXPLAIN_STREAM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2TESTER'.'EXPLAIN_STREAM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'EXPLAIN_STREAM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'EXPLAIN_STREAM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SYSTOOLS'.'HMON_ATM_INFO' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SYSTOOLS'.'HMON_ATM_INFO' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SYSTOOLS'.'HMON_COLLECTION' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SYSTOOLS'.'HMON_COLLECTION' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'INTSTAG2' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'INTSTAG2' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'INTSTAGE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'INTSTAGE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'MASK_ADDRESS_LOOKUP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'MASK_ADDRESS_LOOKUP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'NAS_ADVSER_DETAILS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'NAS_ADVSER_DETAILS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'NAS_DEALER_DETAILS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'NAS_DEALER_DETAILS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'NORTY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'NORTY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'OBJECT_METRICS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'OBJECT_METRICS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'OFCSTAG2' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'OFCSTAG2' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'OFCSTAGE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'OFCSTAGE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SYSTOOLS'.'POLICY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SYSTOOLS'.'POLICY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'VOICEBIO'.'POLMFENR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'VOICEBIO'.'POLMFENR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'NUDI'.'REQUEST_DETAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'NUDI'.'REQUEST_DETAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'NUDI'.'REQUEST_HEADER' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'NUDI'.'REQUEST_HEADER' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'DB2INST1'.'REXTEST1' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'DB2INST1'.'REXTEST1' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'REXX_PARMS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'REXX_PARMS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'VOICEBIO'.'STAFFDET' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'VOICEBIO'.'STAFFDET' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'VOICEBIO'.'STAFFREL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'VOICEBIO'.'STAFFREL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAACTIVY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAACTIVY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAADVPOL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAADVPOL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAEMAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAEMAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGADLK' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGADLK' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGAGAU' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGAGAU' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGEFAC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGEFAC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGLRUL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGLRUL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGMAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGMAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGMREG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGMREG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGNT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGNT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGNTOF' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGNTOF' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGNTOS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGNTOS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGRACT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGRACT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGRMNT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGRMNT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAAGRREL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAAGRREL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGRULE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGRULE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGRULK' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGRULK' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGTDED' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGTDED' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAGTDEH' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAGTDEH' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMCNL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMCNL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMCNT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMCNT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMERR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMERR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMIFC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMIFC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMIFM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMIFM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMSTG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMSTG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMSTL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMSTL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMTRM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMTRM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAKMUPD' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAKMUPD' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAARATES' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAARATES' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAASISER' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAASISER' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAUTHPR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAUTHPR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAAVBI' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAAVBI' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TABENNAM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TABENNAM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TABENNOM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TABENNOM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TABLMAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TABLMAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TABSAMRL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TABSAMRL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLAERR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLAERR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLAGCP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLAGCP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLAMSG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLAMSG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLAPTY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLAPTY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLAROL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLAROL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLASPC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLASPC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLASRL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLASRL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLASSF' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLASSF' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TACLASTP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TACLASTP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLIENT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLIENT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLNTAC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLNTAC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLNTAG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLNTAG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLNTPL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLNTPL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTACT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTACT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTCON' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTCON' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTDET' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTDET' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTOBJ' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTOBJ' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTREG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTREG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTREL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTREL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TACLTRUL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TACLTRUL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTSPC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTSPC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACLTTFN' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACLTTFN' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACMSLNK' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACMSLNK' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACONTDT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACONTDT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACONTHD' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACONTHD' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TACONVEN' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TACONVEN' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TACPCLRG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TACPCLRG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TACUSTPR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TACUSTPR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TADAFEED' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TADAFEED' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TADEFFAC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TADEFFAC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TADISCNT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TADISCNT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TADUMMY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TADUMMY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TADUMMY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TADUMMY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAEMAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAEMAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAEMLDAT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAEMLDAT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TAERRMSG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TAERRMSG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TAERRORS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TAERRORS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TAERRTYP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TAERRTYP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAFAD' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAFAD' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TAFSY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TAFSY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAGNTCOM' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAGNTCOM' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAGPAYBL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAGPAYBL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAKAMACT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAKAMACT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SUPER'.'TAMESRUL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SUPER'.'TAMESRUL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SUPER'.'TAMESTGP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SUPER'.'TAMESTGP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SUPER'.'TAMESTXN' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SUPER'.'TAMESTXN' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TANAMAGR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TANAMAGR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TANAMCOY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TANAMCOY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TANAME' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TANAME' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TANAMREG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TANAMREG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TANEXTNO' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TANEXTNO' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TANOTES' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TANOTES' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOACTRG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOACTRG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJAGR' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJAGR' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJECT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJECT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJSTE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJSTE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJTAC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJTAC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJTRG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJTRG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAOBJTRL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAOBJTRL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAOFFICE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAOFFICE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAORLREG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAORLREG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAPLACE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAPLACE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAPLCECP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAPLCECP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAPLCLAB' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAPLCLAB' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAPLCREL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAPLCREL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAPOLEXT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAPOLEXT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TAPROCTL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TAPROCTL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TAPROPTY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TAPROPTY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAREGIST' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAREGIST' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TARELDET' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TARELDET' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TAROLETP' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TAROLETP' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TARPTDLY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TARPTDLY' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'UTILITY'.'TARSTART' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'UTILITY'.'TARSTART' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASECURE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASECURE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TASPECIF' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TASPECIF' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TASPECRL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TASPECRL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASQLTXT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASQLTXT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TASTEREG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TASTEREG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTD2' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTD2' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTDT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTDT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTHD' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTHD' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTHS' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTHS' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTLG' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTLG' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TASTMTNA' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TASTMTNA' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'SUPER'.'TATRADE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'SUPER'.'TATRADE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'RULES'.'TATYPE' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'RULES'.'TATYPE' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAWELLET' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAWELLET' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAWLMAIL' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAWLMAIL' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAWLPTXT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAWLPTXT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TAWLTPLT' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TAWLTPLT' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'CLIENT'.'TAYRSFAC' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'CLIENT'.'TAYRSFAC' IMMEDIATE CHECKED >>$logfile
echo db2 set constraints for 'AGENT'.'TEMPPOLICY' IMMEDIATE CHECKED >>$logfile
     db2 set constraints for 'AGENT'.'TEMPPOLICY' IMMEDIATE CHECKED >>$logfile


db2 select tabschema,  tabname, substr\(const_checked,1,1\) as pk_check, substr\(const_checked,2,1\) as cc_check  from syscat.tables  where status = 'C'


cat $logfile
exit