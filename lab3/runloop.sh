#!/bin/bash
javac Loop.java
java Loop &
sleep 5000
pkill runloop.sh
exit 0
