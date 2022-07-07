#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

# rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.cache/nvim

DIR=$HOME/.config/nvim

if [ -d $DIR ]; then
  echo "making backup of .config/nvim" 1>&2
  mv $DIR           $DIR.$(date +"%Y%m%d%H%M%S")
fi

if [ ! -d "$DIR" ]; then
  echo "cloning nvim-preconfigured to $DIR" 1>&2
  git clone https://github.com/newlight77/NvChad $DIR --depth 1
fi


echo "*** ------  Customize NeoVim Done ------ ***" 1>&2