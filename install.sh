#!/usr/bin/env bash

if [ ".$1" == ".--help" -o ".$1" == "." ]; then
    echo "Usage: $0 <path>"
    echo "Performs the installation of NANI web server to given path (e.g. /usr/bin)"
    exit 1
fi

if ! [ -e 'nani' ]; then
    echo "NANI is not built yet, build it now?"
    echo "It usually takes a few milliseconds, python3 is required"
    echo -n "[Y/n] "
    read ans
    if [ ".$ans" == ".n" ]; then
        echo "Nothing to do"
        exit 1
    else
        if ./build.py; then
            echo "Built successfully"
        else
            echo "Build failed"
            exit 1
        fi
    fi
fi

echo -n "Install to '$1'? [y/N] "
read ans
if [ ".$ans" == ".y" ]; then
    sudo install -m 0755 nani "$1"
    echo -n "Set file owner to root? [Y/n] "
    read ans
    if [ ".$ans" != ".n" ]; then
        sudo chown root:root "$1/nani"
    fi
else
    echo "Nothing to do"
    exit 1
fi

echo "Installation complete"
