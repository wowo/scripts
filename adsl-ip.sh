#!/bin/bash
echo $@ | grep '\-ip'   > /dev/null && wget http://hostip.info -qO- | grep "IP address:" | egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"
echo $@ | grep '\-host' > /dev/null && wget http://hostip.info -qO- | grep "Host name:" | sed 's/.*<b>//g' | sed 's/\.$//g'
