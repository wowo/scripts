#!/bin/bash
# Wigwam
# Prosty skrypt do pobierania notowań Giełdowych
#
# Używanie:
# ./wigwam.sh nazwa_indeksu [sposob_wyswietlania]
# nazwa_indeksu:
#   WIG
#   WIG20
#   mWIG40
#   sWIG80
# sposob_wyswietlania
#   -percent (zmiena procentowa z znakiem)
#   -value (wartość indeksu)
#   -both (zmiana procentowa i wartość indeksu)
#   -sign (znak zmiany)
#
# Przykłady użycia:
#   ./wigwam.sh WIG20 -percent
#   ./wigwam.sh WIG -value
#   ./wigwam.sh sWIG80 -percent -value
#   ./wigwam.sh WIG20 -both
#   ./wigwam.sh WIG20 -sign
# 
# @author Wojciech Sznapka
# @date 2009-07-01

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
