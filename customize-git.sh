#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Git ------ ***" 1>&2

DIR=/tmp/bash_custom

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR
else
  cd $DIR && git pull origin main
fi

for (
  file in git/.git*
) do
  echo "copying $file to $HOME/.bash_custom/git/" 1>&2
  cp $file $HOME/.bash_custom/git/
done

echo "writing contents of git/.gitconfig to $HOME/.gitconfig" 1>&2
cat ${DIR}/git/.gitconfig               >> $HOME/.gitconfig

echo "*** ------  Customize git Done ------ ***" 1>&2

