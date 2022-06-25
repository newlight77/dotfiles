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

echo "creating folder $HOME/.ndotfiles/vim_config" 1>&2
mkdir -p $HOME/.ndotfiles/vim_config
echo "creating folder $HOME/.config/nvim for NeoVim" 1>&2
mkdir -p .config/nvim

for file in vim/vim_config/*.vim ; do
  echo "copying $file to $HOME/.ndotfiles/vim_config/" 1>&2
  cp $file $HOME/.ndotfiles/vim_config/
done

echo "writing contents of vim/.vimrc-awesome.vim to $HOME/.vimrc" 1>&2
cat vim/.vimrc                           >> $HOME/.vimrc
echo "writing contents of vim/.vimrc-awesome.vim to $HOME/.config/nvim/init.vim for NeoVim" 1>&2
cat vim/.vimrc                           >> $HOME/.config/nvim/init.vim

echo "*** ------  Customize Vim/NeoVim Done ------ ***" 1>&2

