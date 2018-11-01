function fib {
  a=1
  b=1
  iterations=$(expr $1 - 2)
  for (( i=0; i<iterations; i++ ))
  do
    temp=$b
    b=$(expr $a + $b)
    a=$temp
  done
  echo "$b"
}

function main {
    echo "What fib should I calculate?"
    read n
    fib $n
    exit 0
}

main
