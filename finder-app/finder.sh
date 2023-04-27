#!/bin/sh
# Author: Ahmadreza Jahani

set -e
set -u

if [ $# != 2 ]
then   
    echo "Usage: ./finder.sh filesDir srchStr"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]
	then
		echo "$filesdir not exists or is not a directory!"
		exit 1
	fi

nFiles=$(grep -r $searchstr $filesdir -l | wc -l)
nMatch=$(grep -r $searchstr $filesdir | wc -l)

echo "The number of files are ${nFiles} and the number of matching lines are ${nMatch}"
