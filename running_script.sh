#!/bin/bash

var1=
var2=

while getopts ":p:q:" optname
do
    case "${optname}" in
        "p") var1="${OPTARG}";;
        "q") var2="${OPTARG}";;
    esac
done

if [ -z $var1 ]; then
    echo "var1 isn't specified!"
fi

if [ -z "$var2" ]; then
    echo "var2 isn't specified!"
fi

if [ -n $var1 ] && [ -n $var2 ]; then
    # Forcing error with a script that doesn't exists.
    ./bullshit-script
fi

if [ $? -ne 0 ]; then
    ERRORLOG="${PWD}/error.log"
    sudo echo -e "Some errors was founded\n" >> $ERRORLOG
    sudo tail $ERRORLOG
else
    echo "It's done!"
fi

exit 0
