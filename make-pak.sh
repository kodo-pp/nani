#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <package_name>"
    echo "Creates a Pak2 package"
    exit 1
fi

mkdir pak2-package
mkdir -p pak2-package/files/usr/bin
mkdir pak2-package/.pak2

echo 'nani' > pak2-package/.pak2/name
echo '' > pak2-package/.pak2/deps

./build.py
install -m 0755 nani pak2-package/files/usr/bin

cd pak2-package
fakeroot tar -cjvf package.pak files .pak2
cd ..
mv -i pak2-package/package.pak "$1"
rm -rf pak2-package
