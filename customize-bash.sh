#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/dotfiles.git /tmp/dotfiles && cd $DIR
else
  cd $DIR && git pull --rebase origin main
fi

echo "creating folder $HOME/.config/bash" 1>&2
mkdir -p $HOME/.config/bash

for file in bash/.bashrc* ; do
  echo "copying $file to $HOME/.config/bash/" 1>&2
  cp $file $HOME/.config/bash/
done

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cp $HOME/.bashrc                            $HOME/.bashrc.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc
echo "writing contents of bash/.bashrc to $HOME/.zprofile" 1>&2
cp $HOME/.zprofile                          $HOME/.zprofile.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/bash/.bashrc                  >> $HOME/.zprofile

echo "*** ------  Customize Bash Done ------ ***" 1>&2
