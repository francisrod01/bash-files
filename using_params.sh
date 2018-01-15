#!/bin/bash

####
# Usage: sh using_params.sh -p value1 -q value2
####

show_opts() {
    while getopts ":p:q:" optname
    do
        case "${optname}" in
            "p")
                echo "First '${optname}' value is '${OPTARG}'"
                ;;
            "q")
                echo "Second '${optname}' value is '${OPTARG}'"
                ;;
            "?")
                echo "Unknown option '${OPTARG}'"
                ;;
            ":")
                echo "No argument value for option '${OPTARG}'"
                ;;
            "*")
                echo "Uknown error while processing options."
                ;;
        esac
    done
    return ${OPTIND}
}

# Putting it together
optinfo=$(show_opts "$@")
echo $optinfo
