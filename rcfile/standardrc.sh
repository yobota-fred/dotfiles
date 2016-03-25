#!/bin/bash

. /etc/profile

PROJECTS=/e/dev
# PROJECT_TYPE=
# PROJECT_NAME=

PHOME="$PROJECTS/$PROJECT_NAME"
# RC_DEBUG=
THIS_DIR=$(dirname "${BASH_SOURCE[0]}")

if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

. "$THIS_DIR/bashrc.sh"

case "$PROJECT_TYPE" in
	"python")
		. "$THIS_DIR/pythonrc.sh" ;;
	"ruby")
		. "$THIS_DIR/rubyrc.sh" ;;
	"java")
		. "$THIS_DIR/javarc.sh" ;;
esac

cd "$PHOME"

alias rebash=". ${BASH_SOURCE[0]}"
