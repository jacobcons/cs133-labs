#!/bin/sh
if [[ "$#" == "2" -a "$1" =~ [0-9] -a "$2" =~ [0-9] ]]
then
  echo "OK"
else
  echo "Please enter 2 single-digit numeric arguments">&2; exit 1;;
fi
exit 0
