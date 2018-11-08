function file_count {
    $(ls -l $dir | grep '^-' | wc -l)
}

function dir_count {
    $(ls -l $dir | grep '^d' | wc -l)
}

counter(){
    for line in $(ls -l1 $1)
    do
      echo $line
    done
}

fileCount=$(find $1 -type f | wc -l)
let dirCount=$(find $1 -type d | wc -l)-1
echo
