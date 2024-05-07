#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Fish ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ -d "$DIR" ]; then
  rm -fr $DIR
fi
if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/dotfiles.git $DIR
fi

cd $DIR

echo "creating folder $HOME/.config/fish" 1>&2
mkdir -p $HOME/.config/fish

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cp -R $HOME/.config/fish                            $HOME/.config/fish.$(date +"%Y%m%d%H%M%S")

for file in fish/*.fish ; do
  echo "copying $file to $HOME/.config/fish/" 1>&2
  cp $file $HOME/.config/fish/
done

echo "*** ------  Customize Fish Done ------ ***" 1>&2
