#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ ! -d "$DIR" ]; then
  rm -fr $DIR
fi

git clone https://github.com/newlight77/dotfiles.git /tmp/dotfiles && cd $DIR

echo "Configing BASH and ZSH..." 1>&2


## BASH
echo "creating folder $HOME/.config/bash" 1>&2
mkdir -p $HOME/.config/bash

for file in bash/.bashrc* ; do
  echo "copying $file to $HOME/.config/bash/" 1>&2
  cp $file $HOME/.config/bash/
done

echo "writing contents of bash/.bashrc to $HOME/.bashrc" 1>&2
cp $HOME/.bashrc                            $HOME/.bashrc.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc


## ZSH
echo "creating folder $HOME/.config/zsh" 1>&2
mkdir -p $HOME/.config/zsh

for file in zsh/.*.zsh ; do
  echo "copying $file to $HOME/.config/zsh/" 1>&2
  cp $file $HOME/.config/zsh/
done

echo "writing contents of zsh/.zshrc to $HOME/.zshrc" 1>&2
cp $HOME/.zshrc                            $HOME/.zshrc.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/zsh/.zshrc                  >> $HOME/.zshrc
echo "writing contents of zsh/.zprofile to $HOME/.zprofile" 1>&2
cp $HOME/.zprofile                          $HOME/.zprofile.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/zsh/.zprofile                  >> $HOME/.zprofile


curl -L https://iterm2.com/shell_integration/zsh -o $HOME/.config/zsh/.iterm2_shell_integration.zsh
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

echo "*** ------  Customize Bash Done ------ ***" 1>&2
