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


echo '.......... adding git alias ..........'

git config --global alias.lol = '!git --no-pager log --graph --decorate --abbrev-commit --all --date=local -25 --pretty=format:\"%C(auto)%h%d %C(blue)%an %C(green)%cd %C(red)%GG %C(reset)%s\"'
git config --global alias.fza = '!git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 git add'
git config --global alias.gone = '!f() { git fetch --all --prune; git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D; }; f'


echo "adding export GPG_TTY  to PATH in $HOME/.zshrc" 1>&2

echo '
export GPG_TTY=$(tty)
' >> $HOME/.zshrc