#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Util ------ ***" 1>&2

DIR=/tmp/bash_custom

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.bash_custom/util" 1>&2
mkdir -p $HOME/.bash_custom/util

for (
  file in util/*.sh
) do
  echo "copying $file to $HOME/.bash_custom/util/" 1>&2
  cp $file $HOME/.bash_custom/util/
done

echo "*** ------  Customize Util Done ------ ***" 1>&2
