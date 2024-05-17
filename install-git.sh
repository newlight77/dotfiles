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

git config --global core.autocrlf = input
git config --global core.pager = less -iXFR
git config --global core.editor = vim
git config --global color.ui = always
git config --global apply.whitespace = fix
git config --global merge.log = true




echo '.......... adding git alias ..........'

git config --global alias.lol = '!git --no-pager log --graph --decorate --abbrev-commit --all --date=local -25 --pretty=format:\"%C(auto)%h%d %C(blue)%an %C(green)%cd %C(red)%GG %C(reset)%s\"'
git config --global alias.fza = '!git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 git add'
git config --global alias.gone = '!f() { git fetch --all --prune; git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D; }; f'

curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/git/.gitconfig_alias -o ${HOME}/.config/git/gitconfig_alias

if [ ${GIT_USER_EMAIL}x != 'x']; then
    git config --global include.path = $HOME/.config/git/.gitconfig_alias
fi




echo '.......... configure gpg and netrc ..........'

echo '
export GPG_TTY=$(tty)
' >> $HOME/.zshrc

git config --global gpg.program = /opt/homebrew/bin/gpg
git config --global commit.gpgsign = true

echo "retrieve the git-credential-netrc from github"
mkdir $HOME/.config/git/
curl -o $HOME/.config/git/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
chmod +x $HOME/.config/git/bin/git-credential-netrc

echo '
export PATH=$HOME/.config/git/bin:$PATH
' >> $HOME/.zshrc

git config --global credential.helper = netrc -f ~/.netrc.gpg -v
