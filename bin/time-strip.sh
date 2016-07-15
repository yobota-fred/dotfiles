#!/bin/sh
set -e

time_strip() {
    cat |
    # Replace "2 years ago" with -2Y
    sed -Ee 's/([[:digit:]]+) years? ago/-\1Y/' |
    # Replace "2 years, 5 months ago" with -2Y
    sed -Ee 's/([[:digit:]]+) years?, [[:digit:]]+ .*months? ago/-\1Y/' |
    sed -Ee 's/([[:digit:]]+) months? ago/-\1M/' |
    sed -Ee 's/([[:digit:]]+) weeks? ago/-\1w/' |
    sed -Ee 's/([[:digit:]]+) days? ago/-\1d/' |
    sed -Ee 's/([[:digit:]]+) hours? ago/-\1h/' |
    sed -Ee 's/([[:digit:]]+) minutes? ago/-\1m/' |
    sed -Ee 's/([[:digit:]]+) seconds? ago/-\1s/'
}

time_strip
