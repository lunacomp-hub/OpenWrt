#!/bin/sh

TARGET="8.8.8.8"
FAIL=0
MAXFAIL=3

while true
do
    ping -c 3 $TARGET > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        FAIL=$((FAIL+1))
        echo "$(date) Ping gagal ($FAIL/$MAXFAIL)"

        if [ $FAIL -ge $MAXFAIL ]; then
            echo "$(date) Internet mati 3x - Reboot router"
            reboot
        fi
    else
        FAIL=0
        echo "$(date) Internet OK"
    fi

    sleep 300
done
