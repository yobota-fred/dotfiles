#!/bin/sh
# Page only if we're asked to.
set -e

maybe_page() {
    if [ -n "$GIT_NO_PAGER" ]; then
        cat
    else
        # Page only if needed.
        less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines
    fi
}

maybe_page