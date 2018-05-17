# NANI

A small and quite portable HTTP server written on bash.

HTTP support is **very basic**, but at least it can respond to some HTTP
requests.

NANI is based on [nanohttpd.sh](https://github.com/kodo-pp/nanohttpd.sh).

# Requirements

## Runtime

- netcat from `nmap` package (should be available as `ncat`)

- bash; also if you experience some problems make sure that `/bin/sh` is
symbolic (or hard) link to bash.

- file from package `file`

- wc from package `coreutils` (`busybox` one should work too)

## Build time

See Building.

- Python 3

- bash

# Building

It is not a mandatory process when you have just cloned this repo, but
you will need to re-build NANI when you modify some scripts like `server.sh`.

Just run `./build.py`

To install NANI to some specific location, say `/usr/bin`, use `./install.sh /usr/bin`
