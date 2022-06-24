#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/ndotfiles

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/ndotfiles.git /tmp/ndotfiles && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.ndotfiles/bash" 1>&2
mkdir -p $HOME/.ndotfiles/bash

for file in bash/.bashrc* ; do
  echo "copying $file to $HOME/.ndotfiles/bash/" 1>&2
  cp $file $HOME/.ndotfiles/bash/
done

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc
echo "writing contents of bash/.bashrc to $HOME/.zprofile" 1>&2
cat ${DIR}/bash/.bashrc                  >> $HOME/.zprofile

echo "*** ------  Customize Bash Done ------ ***" 1>&2
