#!/bin/bash

echo '........ installing brew ........'

brew update

brew install \
    git \
    tig

echo '........configuring git for ${GIT_USER_NAME}'

if [ ! -f .env ]; then
    echo '.env file is required'
    echo 'you may run this :
        echo "
            GIT_USER_NAME='Your name'
            GIT_USER_EMAIL='Your email'
            GIT_EDITOR=vi
            #GIT_EDITOR=nano
            " > .env
    '
fi

if [ ${GIT_USER_NAME}x != 'x']; then
    git config --global user.name ${GIT_USER_NAME}
fi

if [ ${GIT_USER_EMAIL}x != 'x']; then
    git config --global user.email ${GIT_USER_EMAIL}
fi

if [ ${GIT_EDITOR}x != 'x']; then
    git config --global core.editor ${GIT_EDITOR}
fi
