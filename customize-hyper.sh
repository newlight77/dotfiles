#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Hyper ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ ! -d "$DIR" ]; then
  rm -fr $DIR
fi

git clone https://github.com/newlight77/dotfiles.git /tmp/dotfiles && cd $DIR


echo "creating folder $HOME/.dotfiles/hyper" 1>&2
mkdir -p $HOME/.dotfiles/hyper

for file in hyper/.* ; do
  echo "copying $file to $HOME/.dotfiles/hyper/" 1>&2
  cp $file $HOME/.dotfiles/hyper/
done

echo "writing contents of hyper/.hyper.js to $HOME/.hyper.js" 1>&2
cp $HOME/.hyper.js                          $HOME/.hyper.js.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/hyper/.hyper.js               >> $HOME/.hyper.js

echo "*** ------  Customize Hyper Done ------ ***" 1>&2

