#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Util ------ ***" 1>&2

DIR=/tmp/ndotfiles

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/ndotfiles.git /tmp/ndotfiles && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.ndotfiles/util" 1>&2
mkdir -p $HOME/.ndotfiles/util

for file in util/*.sh ; do
  echo "copying $file to $HOME/.ndotfiles/util/" 1>&2
  cp $file $HOME/.ndotfiles/util/
done

echo "*** ------  Customize Util Done ------ ***" 1>&2
