#!/bin/sh
if [ -n "$RC_DEBUG" ]; then
	echo "Running ${BASH_SOURCE[0]} from `pwd`"
fi

trimmed_dir() {
	echo $PWD | sed "s:^${GIT_BASEDIR}:£:" | sed "s:^${HOME}:~:"
}

__bash_coloured_dir() {
	if [ -z "$PROJECT_NAME" ]; then
		trimmed_dir
	else
		replacement=`echo -e "\001\033[32m\002${PROJECT_NAME}\001\033[33m\002"`
		trimmed_dir | sed "s:${PROJECT_NAME}:$replacement:"
	fi	
}

window_title() {
	trimmed_dir
}

coloured_dir() {
	__bash_coloured_dir
}

formatted_branch() {
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_STATESEPARATOR=''
	__git_ps1 | branch-strip.sh
}

export PS1='\[\033]0;`window_title`\007\]\[\033[33m\]`coloured_dir`\[\033[36m\]`formatted_branch`\[\033[0m\] $ '

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
