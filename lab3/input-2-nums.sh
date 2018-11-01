#!/bin/bash
pattern="^[0-9]$"
if [ "$#" = "2" ] && [[ "$1" =~ $pattern ]] && [[ "$2" =~ $pattern ]]
then
  echo "OK"
else
  echo "Please enter 2 single-digit numeric arguments">&2
  exit 1
fi
exit 0
