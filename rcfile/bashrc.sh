#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

trimmed_dir() {
	echo $PWD | sed "s:^${GIT_BASEDIR}:£:" | sed "s:^${HOME}:~:"
}
export PS1='\[\033]0;`trimmed_dir`\007\]\[\033[33m\]`trimmed_dir`\[\033[36m\]`__git_ps1`\[\033[0m\] $ '

man() {
    "$@" --help | maybe-page.sh
}

£() {
	cd "$PROJECTS/$@"
}

up() {
	dst="../"
	if [ -n "$1" ]; then
		dst=`printf "%${1}s" | sed -e 's: :../:g'`
	fi
	cd $dst
}

alias h="cd $PHOME"
alias x=exit

alias g=git
alias "g+"="git add --all && git staged"
alias "g-"="git reset HEAD --"
alias s="git status"
alias l="git l"
