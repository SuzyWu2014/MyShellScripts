#!/bin/bash
#Program:
#   This program shows example for string processing
# 2016/06/07 Shujin Wu

STR="locations-api-1474324986570-284c816-all.jar"

echo "something-$(echo $(echo $STR) |
    awk '{split($0, subs, "-"); print subs[4]}')"

EMAIL="$(git log -1 | grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})')"
echo $EMAIL
