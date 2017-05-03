#!/bin/bash

rm -f /var/run/apache2/apache2.pid
/usr/sbin/apache2ctl -D FOREGROUND -e info
