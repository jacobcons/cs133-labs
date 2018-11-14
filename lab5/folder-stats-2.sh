function printPermissions {
    name=$1
    stat -c "%A" "$name"
}

function printPermissionsandName {
    name=$1
    permissions=$(printPermissions "$name")
    echo ""$name": "$permissions""
}

function printFilePermissions {
    for file in $(find "$1" ! -path "$1")
    do
        if [[ -f "$file" ]]
        then
            newFileName=$(echo "$file" | sed 's/public_html\///')
            echo "    $newFileName: $(printPermissions "$file")"
            permissions=$(printPermissions "$file")
            if [[ ! "$permissions" =~ -rw-r--r-- ]]
            then
                chmod u=r+w,g=r,o=r "$file"
                changes+=("File "$newFileName" has the wrong permission: "$permissions"\nThis has been changed to: -rw-r--r--")
            fi
        fi
    done
}

chmod -R u=r+w+x,g=r+x,o=r+w+x $1

./folder-stats-1.sh "$1"

echo "Permissions for $1: $(printPermissions "$1")"

changes=()
printFilePermissions $1

permissions=$(printPermissions "$1")
if [[ ! "$permissions" =~ drwxr-xr-x ]]
then
    chmod u=r+w+x,g=r+x,o=r+x "$1"
    echo -e "Directory "$1" has the wrong permission: "$permissions"\nThis has been changed to: drwxr-xr-x"
fi

for change in "${changes[@]}"
do
    echo -e "$change"
done
