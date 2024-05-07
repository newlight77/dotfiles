#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ -d "$DIR" ]; then
  rm -fr $DIR
fi
if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/dotfiles.git $DIR
fi

cd $DIR

echo "creating folder $HOME/.config/bash" 1>&2
mkdir -p $HOME/.config/bash

for file in bash/.bashrc* ; do
  echo "copying $file to $HOME/.config/bash/" 1>&2
  cp $file $HOME/.config/bash/
done

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cp $HOME/.bashrc                            $HOME/.bashrc.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc

curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

echo "*** ------  Customize Bash Done ------ ***" 1>&2
