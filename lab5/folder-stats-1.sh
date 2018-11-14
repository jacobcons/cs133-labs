visibleFileCount=$(find "$1"/** -type f | wc -l)
hiddenFileCount=$(find "$1" -type f -name '.*' | wc -l)
visibleDirCount=$(find "$1"/** -type d | wc -l)
hiddenDirCount=$(find "$1" ! -path "$1" -type d -name '.*' | wc -l)
let totalCount=visibleFileCount+hiddenFileCount+visibleDirCount+hiddenDirCount

echo "Files found: "$visibleFileCount" (plus "$hiddenFileCount" hidden)"
echo "Directories found: "$visibleDirCount" (plus "$hiddenDirCount" hidden)"
echo "Total files and directories: "$totalCount""
