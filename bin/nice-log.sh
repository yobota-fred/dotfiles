#!/bin/sh
set -e

HASH="%Cgreen%H%Creset"
DATE="%C(yellow)%cd%Creset"
AUTHOR="%Cblue%an%Creset"
BRANCH="%C(auto)%d"
DESC="%Creset%s"
FORMAT="$HASH}$DATE}$AUTHOR}$BRANCH $DESC"

git log --color=always --format="$FORMAT" --date=relative $@ |
    time-strip.sh |
    branch-strip.sh |
    awk -F $'}' '{ printf "%s %12s %.9s %s\n", $1, $2, $3, $4; }' |
    flow-color.sh |
    maybe-page.sh
