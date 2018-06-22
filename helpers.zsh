#!/bin/zsh
#
# Set enviroment variable "$1" to default value "$2" if "$1" is not yet defined.
#
# Arguments:
#    1. name - The env variable to set
#    2. val  - The default value 
# Return value:
#    0 if the env variable exists, 3 if it was set
#
function env_default() {
    env | grep -q "^$1=" && return 0 
    export "$1=$2"       && return 3
}

function loopDir {
	for file in $1/*
	do
		$2 $file
	done
}


function sourceDir {
	for file in $1/*/*.$3
	do
		pushd $(dirname $file) > /dev/null
		$2 $(basename $file)
		popd  > /dev/null
	done
}
