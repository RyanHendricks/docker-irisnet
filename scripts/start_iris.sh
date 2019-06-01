#!/bin/sh
set -x

EXECUTABLE=/usr/local/bin/iris

ls -lah /usr/local/bin/iris

exec $EXECUTABLE start --home=$IRISHOME
