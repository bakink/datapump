#!/bin/bash
#================================================================
# HEADER
#================================================================
#% SYNOPSIS
#+    ${SCRIPT_NAME} : expdb.full.backup.sh
#%
#% DESCRIPTION
#%    Bu script gunluk olarak veritabanın full exportunu  
#%    local diske almak için hazirlanmistir.
#% OPTIONS
#%    NA
#%
#% EXAMPLES
#%    ${SCRIPT_NAME} 
#%
#================================================================
#- IMPLEMENTATION
#-    version         ${SCRIPT_NAME} (https://www.dekatechs.com/) 1.0.4
#-    author          dekatechs
#-    copyright       Copyright (c) https://www.dekatechs.com/
#-    license         GNU General Public License
#-    script_id       6501
#-
#================================================================
#  HISTORY
#     2020/03/01 : dekatechs : Script olusturuldu
#     2020/03/12 : dekatechs : test asamasi
#     2020/03/20 : dekatechs : prod asamasi
#================================================================
#  DEBUG OPTION
#    set -n  # Uncomment to check your syntax, without execution.
#    set -x  # Uncomment to debug this shell script
#
#================================================================
# END_OF_HEADER
#================================================================
#echo 'password' | openssl enc -base64 -e -aes-256-cbc -nosalt  -pass pass:garbageKey > .hidden.lck 

. /home/oracle/.bash_profile

l_scr_home=/u01/dekadba
l_runtime=$(date +"%Y%m%d%H%M%S")
l_exdpuser=GMGADMIN
l_expdbpass=$(cat ${l_scr_home}/.hidden.lck | openssl enc -base64 -d -aes-256-cbc -nosalt -pass pass:garbageKey)
l_directory=dumps
l_dumpfile=${ORACLE_SID}_${l_runtime}.dmp
l_logfile=${ORACLE_SID}_${l_runtime}.log

# start the  Export backup
expdp ${l_exdpuser}/${l_expdbpass} directory=${l_directory} dumpfile=${l_dumpfile} logfile=${l_logfile} full=y exclude=statistics 

#================================================================
#Removing 7 days old dump files
#find /backup/DBBKP/EXPBKP  -mtime +6 -exec rm {} \;


#================================================================
# End of script
#================================================================