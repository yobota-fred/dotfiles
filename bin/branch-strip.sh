#!/bin/sh
set -e

branch_strip() {
	sed -Ee 's|origin/|o/|g' |
	sed -Ee 's|feature/|f/|g' |
	sed -Ee 's|hotfix/|h/|g' |
	sed -Ee 's|release/|r/|g' |
	sed -Ee 's|develop|d|g' |
	sed -Ee 's|master|m|g' |
	sed -Ee 's|HEAD|H|g'
}

branch_strip
