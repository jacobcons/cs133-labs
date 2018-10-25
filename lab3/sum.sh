#!/bin/sh
if [[ "$#" == "0" ]]
then
  echo "Usage: sum <number> [<number>...]"
  exit 1
fi

sum=0
for a in $*
do
  case $a in
    [0-9]*) sum=$(expr $a + $sum) ;;
    -h|--help) echo "Usage: sum <number> [<number>...]"; exit 1;;
    *) echo "Arguments must be numbers.">&2; exit 1;;
  esac
done
echo $sum

exit 0
