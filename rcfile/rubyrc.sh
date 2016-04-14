#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

function run_acceptance_tests() {
	cucumber $@
}

# adapted from sucks/rocks by Gary Bernhardt
function run_unit_tests() {
	need_rails=1

	if [ $# -gt 0 ]; then # we have args
	    filename=$1

	    # Remove trailing line numbers from filename, e.g. spec/my_spec.rb:33
	    grep_filename=`echo $1 | sed 's/:.*$//g'`

	    (set +e; grep -r 'rails_helper' $grep_filename) > /dev/null
	    if [ $? -eq 1 ]; then # no match; we have a stand-alone spec
	        need_rails=''
	    fi
	else # we have no args
	    filename='spec'
	fi

	command='rspec'

	if [ $need_rails ]; then
	    command="ruby -S bundle exec $command"
	fi

	if [ -n "$RC_DEBUG" ]; then
		echo "Running $command $filename"
	fi
	RAILS_ENV=test $command $filename
}

function ruby_find() {
	ack --ruby -A 2 --smart-case --pager="maybe-page.sh" "$@"
}

alias at=run_acceptance_tests
alias ut=run_unit_tests
alias ds="rails server"
alias ?=ruby_find