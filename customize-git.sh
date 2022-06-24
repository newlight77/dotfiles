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

cp  ${DIR}/git/.gitconfig_alias            $HOME/.bash_custom/git/.gitconfig_alias
cat ${DIR}/git/.gitconfig               >> $HOME/.gitconfig

echo "*** ------  Customize git Done ------ ***" 1>&2

