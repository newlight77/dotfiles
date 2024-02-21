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

if type brew &>/dev/null; then
    FPATH=/usr/local/share/zsh-completions:/Users/kong/.oh-my-zsh/plugins/git:/Users/kong/.oh-my-zsh/functions:/Users/kong/.oh-my-zsh/completions:/Users/kong/.oh-my-zsh/cache/completions:/usr/local/share/zsh/site-functions:/usr/share/zsh/site-functions:/usr/share/zsh/5.8.1/functions

    autoload -Uz compinit
    compinit
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
