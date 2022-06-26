#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Hyper ------ ***" 1>&2

DIR=/tmp/ndotfiles

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/ndotfiles.git /tmp/ndotfiles && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.ndotfiles/hyper" 1>&2
mkdir -p $HOME/.ndotfiles/hyper

for file in hyper/.* ; do
  echo "copying $file to $HOME/.ndotfiles/hyper/" 1>&2
  cp $file $HOME/.ndotfiles/hyper/
done

echo "writing contents of hyper/.hyper.js to $HOME/.hyper.js" 1>&2
mv $HOME/.hyper.js                          $HOME/.hyper.js.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/hyper/.hyper.js               >> $HOME/.hyper.js

echo "*** ------  Customize Hyper Done ------ ***" 1>&2

