#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

export VENV="$HOME/virtualenvs/$PROJECT"

__venv_ps1='\[\033[35m\]`basename "$VIRTUAL_ENV"`\[\033[0m\]:'$PS1
. "$VENV/Scripts/activate"
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
