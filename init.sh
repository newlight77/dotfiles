#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom

rm -r $DIR
git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR
