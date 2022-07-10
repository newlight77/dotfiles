#!/bin/bash


#############################################
# github.com/newlight77/dotfiles

if [ -f $HOME/.config/bash/.bashrc_alias ]; then
    source $HOME/.config/bash/.bashrc_alias
fi

if [ -f $HOME/.config/bash/.bashrc_docker ]; then
    source $HOME/.config/bash/.bashrc_docker
fi

if [ -f $HOME/.config/bash/.bashrc_fs ]; then
    source $HOME/.config/bash/.bashrc_fs
fi

if [ -f $HOME/.config/bash/.bashrc_general ]; then
    source $HOME/.config/bash/.bashrc_general
fi

if [ -f $HOME/.config/bash/.bashrc_macos ]; then
    source $HOME/.config/bash/.bashrc_macos
fi

if [ -f $HOME/.config/bash/.bashrc_network ]; then
    source $HOME/.config/bash/.bashrc_network
fi

if [ -f $HOME/.config/bash/.bashrc_search ]; then
    source $HOME/.config/bash/.bashrc_search
fi

if [ -f $HOME/.config/bash/.bashrc_vars ]; then
    source $HOME/.config/bash/.bashrc_vars
fi

# github.com/newlight77/ditfiles
#############################################
