#!/bin/sh

set -e

hotfix_done() {
    MASTER_BRANCH="master"
    DEV_BRANCH="develop"
    HF_BRANCH="hotfix/$1"

    git checkout $MASTER_BRANCH && \
    git merge --no-ff $HF_BRANCH && \
    git checkout $DEV_BRANCH && \
    git merge --no-ff $HF_BRANCH && \
    git branch -d $HF_BRANCH
}

hotfix_done $@
