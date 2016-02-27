#!/bin/bash

while true;

do

./sniffer_all br0 > ip-field.txt

sleep 5

ps -ef | grep "sniffer_all" | awk '{print $2}' | xargs kill > /dev/null 2>&1

./extractor.sh > /dev/null 2>&1

done
