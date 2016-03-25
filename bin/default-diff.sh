#!/bin/sh

set -e

git diff --ignore-space-at-eol --ignore-blank-lines --color "$@"
