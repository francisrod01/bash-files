#!/bin/bash

####
# Usage: sh test_args.sh -p -q abcdef
####

show_opts() {
	while getopts ":pq:" optname
		do
			case "$optname" in
				"p")
					echo "Option $optname is specified"
					;;
				"q")
					echo "Option $optname has value $OPTARG"
					;;
				"?")
					echo "Unknown option $OPTARG"
					;;
				":")
					echo "No argument value for option $OPTARG"
					;;
				"*")
				# Should not occur.
					echo "Unknown error while processing options"
					;;
      esac
    done
  return $OPTIND
}

show_args() {
  for p in "$@"
    do
      echo "[$p]"
    done
}

optinfo=$(show_opts "$@")
argstart=$?
arginfo=$(show_args "${@:$argstart}")

echo "Arguments are: $arginfo"
echo "Options are: $optinfo"
