#!/usr/bin/env bash


#############################################
## Functions
#############################################

retrieve_customizations() {

  echo "creating folder $HOME/.config/bash" 1>&2
  mkdir -p $HOME/.config/bash

  echo "retrieve all bash custom into $HOME/.config/bash" 1>&2
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc         -o ${HOME}/.config/bash/.bashrc
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_alias   -o ${HOME}/.config/bash/.bashrc_alias
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_alias_extended   -o ${HOME}/.config/bash/.bashrc_alias_extended
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_docker  -o ${HOME}/.config/bash/.bashrc_docker
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_fs      -o ${HOME}/.config/bash/.bashrc_fs
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_general -o ${HOME}/.config/bash/.bashrc_general
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_macos   -o ${HOME}/.config/bash/.bashrc_macos
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_network -o ${HOME}/.config/bash/.bashrc_network
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_search  -o ${HOME}/.config/bash/.bashrc_search
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_vars    -o ${HOME}/.config/bash/.bashrc_vars
  curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/bash/.bashrc_web     -o ${HOME}/.config/bash/.bashrc_web

}

configure_zshrc() {
  echo '
if [ -f $HOME/.config/bash/.bashrc ]; then
  source $HOME/.config/bash/.bashrc
fi
' >> .zprofile
}



#############################################
## Run
#############################################

echo "*** ------  Customize ------ ***" 1>&2
echo "Configuring BASH and source in ZSH..." 1>&2

retrieve_customizations
configure_zshrc

echo "*** ------  Customize Bash Done ------ ***" 1>&2
