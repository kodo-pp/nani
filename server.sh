dir='{server_dir}'
page403='{page403}'
page404='{page404}'
page500='{page500}'
index_file='{index_file}'

read method path version
cd "$dir"
echo Requested path: "$path" >&2

if [[ $path/ =~ .*[.][.]/.* ]]; then
    echo "HTTP/1.0 502 Bad Request"
    echo "Content-Type: $(echo "$page500" | file -bi -)"
    echo "Content-Length: $(echo "$page500" | wc -c)"
    echo "X-Powered-By: NANI/1.0"
    echo
    echo "$page500"
    exit
fi

if [ -d "./$path" ]; then
    path="$path/$index_file"
    echo "Appending index file: $path" >&2
fi

if [ -f "./$path" ]; then
    echo "HTTP/1.0 200 OK"
    echo "Content-Type: $(file -bi "./$path")"
    echo "Content-Length: $(stat -c %s "./$path")"
    echo "X-Powered-By: NANI/1.0"
    echo
    cat "./$path"
else
    echo "HTTP/1.0 404 Not Found"
    echo "Content-Type: $(echo "$page404" | file -bi -)"
    echo "Content-Length: $(echo "$page404" | wc -c)"
    echo "X-Powered-By: NANI/1.0"
    echo
    echo "$page404"
    exit
fi
