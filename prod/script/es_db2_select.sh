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

logfile=$ENVTOP/logs/db2_select.log
export logfile

rm -f $logfile
              
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
  
db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD >>$logfile

echo db2 select  'count(*)' FROM 'AGENT'.'ADMINCNF';  >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADMINCNF';  >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'ADOSTAG2'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'ADOSTAG2'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'ADOSTAGE'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'ADOSTAGE'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'ADVADCNF'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADVADCNF'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'ADVAPADM'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADVAPADM'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'ADVIMPLG'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADVIMPLG'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_INDEX'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_INDEX'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_INSTANCE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_INSTANCE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_MQT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_MQT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_PARTITION'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_PARTITION'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_TABLE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_TABLE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_WORKLOAD'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'ADVISE_WORKLOAD'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'ADVSTAG2'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADVSTAG2'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'ADVSTAGE'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'ADVSTAGE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_ACTUALS'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_ACTUALS'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_ARGUMENT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_ARGUMENT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_ARGUMENT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_ARGUMENT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_DIAGNOSTIC_DATA'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_DIAGNOSTIC_DATA'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_INSTANCE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_INSTANCE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_INSTANCE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_INSTANCE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_OBJECT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_OBJECT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_OBJECT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_OBJECT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_OPERATOR'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_OPERATOR'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_OPERATOR'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_OPERATOR'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_PREDICATE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_PREDICATE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_PREDICATE'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_PREDICATE'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_STATEMENT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_STATEMENT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_STATEMENT'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_STATEMENT'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_STREAM'; >>$logfile
     db2 select  'count(*)' FROM 'DB2TESTER'.'EXPLAIN_STREAM'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_STREAM'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'EXPLAIN_STREAM'; >>$logfile
echo db2 select  'count(*)' FROM 'SYSTOOLS'.'HMON_ATM_INFO'; >>$logfile
     db2 select  'count(*)' FROM 'SYSTOOLS'.'HMON_ATM_INFO'; >>$logfile
echo db2 select  'count(*)' FROM 'SYSTOOLS'.'HMON_COLLECTION'; >>$logfile
     db2 select  'count(*)' FROM 'SYSTOOLS'.'HMON_COLLECTION'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'INTSTAG2'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'INTSTAG2'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'INTSTAGE'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'INTSTAGE'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'MASK_ADDRESS_LOOKUP'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'MASK_ADDRESS_LOOKUP'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'NAS_ADVSER_DETAILS'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'NAS_ADVSER_DETAILS'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'NAS_DEALER_DETAILS'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'NAS_DEALER_DETAILS'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'NORTY'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'NORTY'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'OBJECT_METRICS'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'OBJECT_METRICS'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'OFCSTAG2'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'OFCSTAG2'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'OFCSTAGE'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'OFCSTAGE'; >>$logfile
echo db2 select  'count(*)' FROM 'SYSTOOLS'.'POLICY'; >>$logfile
     db2 select  'count(*)' FROM 'SYSTOOLS'.'POLICY'; >>$logfile
echo db2 select  'count(*)' FROM 'VOICEBIO'.'POLMFENR'; >>$logfile
     db2 select  'count(*)' FROM 'VOICEBIO'.'POLMFENR'; >>$logfile
echo db2 select  'count(*)' FROM 'NUDI'.'REQUEST_DETAIL'; >>$logfile
     db2 select  'count(*)' FROM 'NUDI'.'REQUEST_DETAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'NUDI'.'REQUEST_HEADER'; >>$logfile
     db2 select  'count(*)' FROM 'NUDI'.'REQUEST_HEADER'; >>$logfile
echo db2 select  'count(*)' FROM 'DB2INST1'.'REXTEST1'; >>$logfile
     db2 select  'count(*)' FROM 'DB2INST1'.'REXTEST1'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'REXX_PARMS'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'REXX_PARMS'; >>$logfile
echo db2 select  'count(*)' FROM 'VOICEBIO'.'STAFFDET'; >>$logfile
     db2 select  'count(*)' FROM 'VOICEBIO'.'STAFFDET'; >>$logfile
echo db2 select  'count(*)' FROM 'VOICEBIO'.'STAFFREL'; >>$logfile
     db2 select  'count(*)' FROM 'VOICEBIO'.'STAFFREL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAACTIVY'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAACTIVY'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAADVPOL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAADVPOL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAEMAIL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAEMAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGADLK'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGADLK'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGAGAU'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGAGAU'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGEFAC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGEFAC'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGLRUL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGLRUL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGMAIL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGMAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGMREG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGMREG'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGNT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGNT'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGNTOF'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGNTOF'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGNTOS'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGNTOS'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGRACT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGRACT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGRMNT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGRMNT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAAGRREL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAAGRREL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGRULE'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGRULE'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGRULK'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGRULK'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGTDED'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGTDED'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAGTDEH'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAGTDEH'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMCNL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMCNL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMCNT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMCNT'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMERR'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMERR'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMIFC'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMIFC'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMIFM'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMIFM'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMSTG'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMSTG'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMSTL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMSTL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMTRM'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMTRM'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAKMUPD'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAKMUPD'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAARATES'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAARATES'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAASISER'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAASISER'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAUTHPR'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAUTHPR'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAAVBI'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAAVBI'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TABENNAM'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TABENNAM'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TABENNOM'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TABENNOM'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TABLMAIL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TABLMAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TABSAMRL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TABSAMRL'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLAERR'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLAERR'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLAGCP'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLAGCP'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLAMSG'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLAMSG'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLAPTY'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLAPTY'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLAROL'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLAROL'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLASPC'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLASPC'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLASRL'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLASRL'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLASSF'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLASSF'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TACLASTP'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TACLASTP'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLIENT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLIENT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLNTAC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLNTAC'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLNTAG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLNTAG'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLNTPL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLNTPL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTACT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTACT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTCON'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTCON'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTDET'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTDET'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTOBJ'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTOBJ'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTREG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTREG'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTREL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTREL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TACLTRUL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TACLTRUL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTSPC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTSPC'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACLTTFN'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACLTTFN'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACMSLNK'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACMSLNK'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACONTDT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACONTDT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACONTHD'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACONTHD'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TACONVEN'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TACONVEN'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TACPCLRG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TACPCLRG'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TACUSTPR'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TACUSTPR'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TADAFEED'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TADAFEED'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TADEFFAC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TADEFFAC'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TADISCNT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TADISCNT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TADUMMY'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TADUMMY'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TADUMMY'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TADUMMY'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAEMAIL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAEMAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAEMLDAT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAEMLDAT'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TAERRMSG'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TAERRMSG'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TAERRORS'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TAERRORS'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TAERRTYP'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TAERRTYP'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAFAD'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAFAD'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TAFSY'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TAFSY'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAGNTCOM'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAGNTCOM'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAGPAYBL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAGPAYBL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAKAMACT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAKAMACT'; >>$logfile
echo db2 select  'count(*)' FROM 'SUPER'.'TAMESRUL'; >>$logfile
     db2 select  'count(*)' FROM 'SUPER'.'TAMESRUL'; >>$logfile
echo db2 select  'count(*)' FROM 'SUPER'.'TAMESTGP'; >>$logfile
     db2 select  'count(*)' FROM 'SUPER'.'TAMESTGP'; >>$logfile
echo db2 select  'count(*)' FROM 'SUPER'.'TAMESTXN'; >>$logfile
     db2 select  'count(*)' FROM 'SUPER'.'TAMESTXN'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TANAMAGR'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TANAMAGR'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TANAMCOY'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TANAMCOY'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TANAME'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TANAME'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TANAMREG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TANAMREG'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TANEXTNO'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TANEXTNO'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TANOTES'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TANOTES'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOACTRG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOACTRG'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJAGR'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJAGR'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJECT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJECT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJSTE'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJSTE'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTAC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTAC'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTRG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTRG'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTRL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAOBJTRL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAOFFICE'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAOFFICE'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAORLREG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAORLREG'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAPLACE'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAPLACE'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAPLCECP'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAPLCECP'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAPLCLAB'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAPLCLAB'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAPLCREL'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAPLCREL'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAPOLEXT'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAPOLEXT'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TAPROCTL'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TAPROCTL'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TAPROPTY'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TAPROPTY'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAREGIST'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAREGIST'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TARELDET'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TARELDET'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TAROLETP'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TAROLETP'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TARPTDLY'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TARPTDLY'; >>$logfile
echo db2 select  'count(*)' FROM 'UTILITY'.'TARSTART'; >>$logfile
     db2 select  'count(*)' FROM 'UTILITY'.'TARSTART'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASECURE'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASECURE'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TASPECIF'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TASPECIF'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TASPECRL'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TASPECRL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASQLTXT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASQLTXT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TASTEREG'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TASTEREG'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTD2'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTD2'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTDT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTDT'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTHD'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTHD'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTHS'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTHS'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTLG'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTLG'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TASTMTNA'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TASTMTNA'; >>$logfile
echo db2 select  'count(*)' FROM 'SUPER'.'TATRADE'; >>$logfile
     db2 select  'count(*)' FROM 'SUPER'.'TATRADE'; >>$logfile
echo db2 select  'count(*)' FROM 'RULES'.'TATYPE'; >>$logfile
     db2 select  'count(*)' FROM 'RULES'.'TATYPE'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAWELLET'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAWELLET'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAWLMAIL'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAWLMAIL'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAWLPTXT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAWLPTXT'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TAWLTPLT'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TAWLTPLT'; >>$logfile
echo db2 select  'count(*)' FROM 'CLIENT'.'TAYRSFAC'; >>$logfile
     db2 select  'count(*)' FROM 'CLIENT'.'TAYRSFAC'; >>$logfile
echo db2 select  'count(*)' FROM 'AGENT'.'TEMPPOLICY'; >>$logfile
     db2 select  'count(*)' FROM 'AGENT'.'TEMPPOLICY'; >>$logfile

cat $logfile
exit