#!/bin/bash
if [ -z $1 ]; then
  echo
  echo "Usage $0 index_name [-percent][-value][-both][-sign]"
fi
base=`wget -qO- http://m.gpw.pl/ | egrep -o "$1&nbsp;[^%]+?[0-9\.]+?%[^\.]*[0-9\.]+"`
percent=`echo $base |egrep -o "[-\+]?[0-9\.]+%"`
value=`echo $base |egrep -o "[0-9\. ]+$"`
echo $@  | grep '\-percent' > /dev/null && echo $percent
echo $@  | grep '\-value'   > /dev/null && echo $value
echo $@  | grep '\-both'    > /dev/null && echo $percent $value
echo $@  | grep '\-sign'    > /dev/null && echo ${percent:0:1}
