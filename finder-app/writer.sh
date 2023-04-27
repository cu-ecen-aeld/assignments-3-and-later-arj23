#!/bin/sh
# Author: Ahmadreza Jahani

set -u

if [ $# != 2 ]
then   
    echo "Usage: ./writer.sh writefile writeStr"
    exit 1
fi

writefile=$1
writeStr=$2

if [ ! -d "$(dirname "$writefile")" ]
then
    mkdir -p "$(dirname "$writefile")"
fi

touch $writefile
if [ ! $? -eq 0 ]
then
    echo "Cannot create file ${writefile}"
    exit 1
fi
echo $writeStr > $writefile
