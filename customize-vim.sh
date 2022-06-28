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

echo "creating folder $HOME/.config/nvim for NeoVim" 1>&2
mkdir -p $HOME.config/nvim

configDir=$HOME/.ndotfiles/vim_config/
echo "creating folder $HOME/.ndotfiles/vim_config" 1>&2
mkdir -p $configDir
for file in vim/vim_config/*.vim ; do
  echo "copying $file to $configDir" 1>&2
  cp $file $configDir
done

#pluginsDir=$HOME/.config/nvim/after/plugin/
pluginsDir=$HOME/.ndotfiles/vim_config/after/plugin/
echo "creating folder $HOME/.ndotfiles/vim_config/after/plugin for NeoVim" 1>&2
mkdir -p $pluginsDir
for file2 in vim/vim_config/after/plugin/* ; do
  echo "copying $file2 to $pluginsDir" 1>&2
  cp $file2 $pluginsDir
done

echo "writing contents of vim/.vimrc to $HOME/.vimrc" 1>&2
mv $HOME/.vimrc                            $HOME/.vimrc.$(date +"%Y%m%d%H%M%S")
cat vim/.vimrc                           > $HOME/.vimrc
echo "writing contents of vim/init.vim to $HOME/.config/nvim/init.vim for NeoVim" 1>&2
mv $HOME/.config/nvim/init.vim             $HOME/.config/nvim/init.vim.$(date +"%Y%m%d%H%M%S")
cat vim/.vimrc                           > $HOME/.config/nvim/init.vim

echo "*** ------  Customize Vim/NeoVim Done ------ ***" 1>&2

