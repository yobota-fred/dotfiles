#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

function ack_ticket() {
    ack --java -A 2 --smart-case --pager="maybe-page.sh" "$1-$2\\b" integration-tests*/src/test/java
}

function java_find() {
    ack --java -A 2 --smart-case --pager="maybe-page.sh" "$@" **/java
}

function bump() {
	mvn versions:set -DnewVersion="$1" -DgenerateBackupPoms=false
}

alias ?=java_find

# alias board="ack_ticket \"BOARD\""
