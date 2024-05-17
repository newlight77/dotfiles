#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Util ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ -d "$DIR" ]; then
  rm -fr $DIR
fi
if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/dotfiles.git $DIR
fi

cd $DIR

echo "creating folder $HOME/.config/util" 1>&2
mkdir -p $HOME/.config/util

for file in util/*.sh ; do
  echo "copying $file to $HOME/.config/util/" 1>&2
  cp $file $HOME/.config/util/
done

cp $HOME/.zshrc                         $HOME/.zshrc.$(date +"%Y%m%d%H%M%S")
echo '
# ===================================================================
# added by https://github.com/newlight77/dotfiles
export PATH=$HOME/.config/util/:$PATH
# ===================================================================

' >> $HOME/.zshrc

echo "*** ------  Customize Util Done ------ ***" 1>&2
