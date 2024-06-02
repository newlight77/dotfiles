#!/usr/bin/env bash

#############################################
## Functions
#############################################

installUtil() {
    curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/util/ssh-agent.sh         -o ${HOME}/.config/util/ssh-agent.sh
    curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/util/docker_cleanup.sh    -o ${HOME}/.config/util/docker_cleanup.sh

    echo '
    export PATH=$HOME/.config/util/:$PATH
    ' >> ~/.zprofile
}


#############################################
## Run
#############################################

installUtil