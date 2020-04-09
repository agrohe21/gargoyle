#1/bin/sh
sed 's/"//'|awk '{ if($2 >= 99) { print } }'
