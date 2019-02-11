#!/bin/bash
export myservicename="beyond's aka $(hostname) LAN Trash place"
export myserviceport=5555
export myservicetext="Lan trash pooool"
export myserviceprotocol="tcp"
export filetostoredump="/tmp/trashdata.txt"


avahi-publish -s "$myservicename" _rfb._$myserviceprotocol 5555 "$myservicetext" >publish-output.txt 2>publish-error.txt & 
avahipid=$!
echo "PID for publishing script is:"$avahipid
nc -v -l -k $myserviceport >trash-output.txt 2>socketlisten-error.txt &
ncpid=$!
echo "PID for NC listening script is:"$ncpid


#dump pids to file for cleanup
echo $avahipid >> processes.pid
echo $ncpid >> processes.pid

