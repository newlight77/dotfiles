#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.bash_custom/bash" 1>&2
mkdir -p $HOME/.bash_custom/bash

for (
  file in bash/.bashrc*
) do
  echo "copying $file to $HOME/.bash_custom/bash/" 1>&2
  cp $file $HOME/.bash_custom/bash/
done

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc
echo "writing contents of bash/.bashrc to $HOME/.zprofile" 1>&2
cat ${DIR}/bash/.bashrc                  >> $HOME/.zprofile

echo "*** ------  Customize Bash Done ------ ***" 1>&2
