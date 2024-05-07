#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Git ------ ***" 1>&2

DIR=/tmp/dotfiles

if [ -d "$DIR" ]; then
  rm -fr $DIR
fi
if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/dotfiles.git $DIR
fi

cd $DIR

echo "creating folder $HOME/.config/git" 1>&2
mkdir -p $HOME/.config/git

for file in git/.gitconfig_* ; do
  echo "copying $file to $HOME/.config/git/" 1>&2
  cp $file $HOME/.config/git/
done

echo "retrieve the git-credential-netrc from github"
mkdir $HOME/.config/util/
curl -o $HOME/.config/util/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
chmod +x $HOME/.config/util/git-credential-netrc

cp $HOME/.zshrc                         $HOME/.zshrc.$(date +"%Y%m%d%H%M%S")
echo "adding export GPG_TTY and add git-credential-netrc to PATH in $HOME/.zshrc" 1>&2
echo '
# ===================================================================
# added by https://github.com/newlight77/dotfiles
export PATH=$HOME/.config/util/:$PATH
export GPG_TTY=$(tty)
# ===================================================================
' >> $HOME/.zshrc

echo "writing contents of git/.gitconfig to $HOME/.gitconfig" 1>&2
cp $HOME/.gitconfig                        $HOME/.gitconfig.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/git/.gitconfig               >> $HOME/.gitconfig

echo "*** ------  Customize git Done ------ ***" 1>&2

