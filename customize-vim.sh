#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom
cd $DIR

mkdir -p $HOME/.vim_awesome
mkdir -p .config/nvim

cp  vim/.vim_awesome/general.vim                        $HOME/.vim_awesome/general.vim
cp  vim/.vim_awesome/general-mappings.vim               $HOME/.vim_awesome/general-mappings.vim
cp  vim/.vim_awesome/functions.vim                      $HOME/.vim_awesome/functions.vim
cp  vim/.vim_awesome/filetypes.vim                      $HOME/.vim_awesome/filetypes.vim
cp  vim/.vim_awesome/filetypes-mappings.vim             $HOME/.vim_awesome/filetypes-mappings.vim 
cp  vim/.vim_awesome/plugins.vim                        $HOME/.vim_awesome/plugins.vim
cp  vim/.vim_awesome/plugins-mappings.vim               $HOME/.vim_awesome/plugins-mappings.vim
cp  vim/.vim_awesome/plugins-color-theme.vim            $HOME/.vim_awesome/plugins-color-theme.vim
cat vim/.vimrc-awesome.vim                              > $HOME/.vimrc
cat vim/.vimrc-awesome.vim                              > $HOME/.config/nvim/init.vim


echo "*** ------  Customize Vim/NeoVim Done ------ ***" 1>&2

