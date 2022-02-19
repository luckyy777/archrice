file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

cd "$dir" || exit 1
echo "$file"
cat "$file" | grep -v '\\' | wc -w
