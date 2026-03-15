#!/bin/sh

while true
do
    ping -c 1 1.1.1.1 > /dev/null 2>&1
    ping -c 1 8.8.8.8 > /dev/null 2>&1
    ping -c 1 9.9.9.9 > /dev/null 2>&1
    sleep 2
done
