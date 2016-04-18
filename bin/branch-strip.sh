#!/bin/sh
set -e

branch_strip() {
	sed -Ee 's|origin/|o/|' |
	sed -Ee 's|feature/|f/|' |
	sed -Ee 's|hotfix/|h/|' |
	sed -Ee 's|release/|r/|' |
	sed -Ee 's|develop|d|' |
	sed -Ee 's|master|m|' |
	sed -Ee 's|HEAD|H|'
}

branch_strip
