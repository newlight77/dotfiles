#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

# DIR=/tmp/ndotfiles

# if [ ! -d "$DIR" ]; then
#   git clone https://github.com/newlight77/ndotfiles.git /tmp/ndotfiles && cd $DIR
# else
#   cd $DIR && git pull origin main
# fi

echo "creating folder $HOME/.config/nvim for NeoVim" 1>&2
mkdir -p $HOME.config/nvim

configDir=$HOME/.config/nvim/lua
echo "creating folder $HOME/.config/nvim/lua" 1>&2
mkdir -p $configDir
for file in nvim/lua/*.lua ; do
  echo "copying $file to $configDir" 1>&2
  cp $file $configDir
done

# pluginsDir=$HOME/.config/nvim/after/plugin/
pluginsDir=$HOME/.config/nvim/lua/plugs/
echo "creating folder $pluginsDir for NeoVim" 1>&2
mkdir -p $pluginsDir
for file2 in nvim/lua/plugs/* ; do
  echo "copying $file2 to $pluginsDir" 1>&2
  cp $file2 $pluginsDir
done

if [ -f $HOME/.config/nvim/init.vim  ]; then
  echo "making backup of .config/nvim/init.vim" 1>&2
  mv $HOME/.config/nvim/init.vim             $HOME/.config/nvim/init.vim.$(date +"%Y%m%d%H%M%S")
fi

echo "writing contents of nvim/init.lua to $HOME/.config/nvim/init.lua for NeoVim" 1>&2
mv $HOME/.config/nvim/init.lua             $HOME/.config/nvim/init.lua.$(date +"%Y%m%d%H%M%S")
cat nvim/init.lua                        > $HOME/.config/nvim/init.lua

echo "*** ------  Customize NeoVim Done ------ ***" 1>&2

