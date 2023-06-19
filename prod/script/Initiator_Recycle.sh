#!/bin/bash
set -x
export es_region=MLC
export max_virt_size=11000

if [[ "$1" == "" ]]; then 
   echo SEP Recycle Process Started
else
   echo SEP Checking Process Started
fi 

for sep_line in $(ps -ef | grep "cassi32 /r$es_region" | grep "\-B" | awk -F ' ' '{ print $2 $10 }');
do

   sep_pid=$(echo $sep_line | awk -F "-" '{ print $1 }')
   sep_class=$(echo $sep_line | awk -F "-B" '{ print $2 }')

   VIRT=$(top -b -n1 | grep "$sep_pid" | tail -1 | awk '{print $5}')

   if [[ "$1" == "" ]]; then 
      if [ $VIRT -gt $max_virt_size ]; then
         echo Recycling : PID $sep_pid, Class $sep_class, Virt $VIRT
         casout /l$es_region /i$sep_class
         casout /l$es_region /t$sep_pid
      fi
   else
      if [ $VIRT -gt $max_virt_size ]; then
         echo Storage Exceeded : PID $sep_pid, Class $sep_class, Virt $VIRT
      fi
   fi

done

if [[ "$1" == "" ]]; then 
   echo SEP Recycle Process Ended
else
   echo SEP Checking Process Ended
fi 

