#!/usr/bin/env fish

nmcli device wifi list >> /dev/null
nmcli device wifi connect $argv[1] password $WIFI_PASSWD >> /dev/null
