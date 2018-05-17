#!/usr/bin/env bash

port=8091
index_file='index.html'
page403='{page403}'
page404='{page404}'
page500='{page500}'
dir='.'

while ! [ -z "$1" ]; do
    case "$1" in
        -p|--port)
            port="$2"
            shift
            shift
            ;;
        -I|--index-file)
            index_file="$2"
            shift
            shift
            ;;
        -d|--root-dir)
            dir="$2"
            shift
            shift
            ;;
        *)
            echo "Usage: $0 [-p port] [-I index_filename] [-d root_directory]"
            exit 1
    esac
done

ncat -vlkc '{server_cmd}' "$port"
