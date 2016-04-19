#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

trimmed_dir() {
	echo $PWD | sed "s:^${GIT_BASEDIR}:£:" | sed "s:^${HOME}:~:"
}

formatted_branch() {
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_STATESEPARATOR=''
	__git_ps1 | branch-strip.sh
}

export PS1='\[\033]0;`trimmed_dir`\007\]\[\033[33m\]`trimmed_dir`\[\033[36m\]`formatted_branch`\[\033[0m\] $ '

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
