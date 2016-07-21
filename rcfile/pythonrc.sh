#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

# export VIRTUAL_ENV="$WORKON_HOME/$PROJECT_NAME" # still needed on Windows?

window_title () {
	if [ -z "$VIRTUAL_ENV" ]; then
		trimmed_dir
	else
		echo "`trimmed_dir` (virtualenv `basename $VIRTUAL_ENV`)"
	fi
}

coloured_dir() {
	if [ -z "$VIRTUAL_ENV" ]; then
		__bash_coloured_dir
	else
		__bash_coloured_dir | sed "s:`basename $VIRTUAL_ENV`:`printf \"\\033[1m\`basename $VIRTUAL_ENV\`\\033[22m\"`:"
	fi
}

__venv_ps1=$PS1

if [ -f "$VIRTUAL_ENV/Scripts/activate" ]; then # on Windows + Git bash
	. "$VIRTUAL_ENV/Scripts/activate"
# elif [ -f "$VIRTUAL_ENV/bin/activate" ]; then # on Linux
# 	. "$VIRTUAL_ENV/bin/activate"
fi

export PS1=$__venv_ps1
unset __venv_ps1

function run_acceptance_tests() {
	behave "$PHOME/acceptance_tests/$1" --color
}

function run_unit_tests() {
	py.test "$PHOME/tests/$1" --color=yes
}

function run_dev_server() {
	python "$PHOME/serve.py"
}

function python_find() {
	ack --python -A 2 --smart-case --pager="maybe-page.sh" "$@"
}

alias at=run_acceptance_tests
alias ut=run_unit_tests
alias ds=run_dev_server
alias p="python"
alias "?"=python_find
