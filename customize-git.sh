#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Git ------ ***" 1>&2

DIR=/tmp/ndotfiles

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/ndotfiles.git /tmp/ndotfiles && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.ndotfiles/git" 1>&2
mkdir -p $HOME/.ndotfiles/git

for file in git/.git* ; do
  echo "copying $file to $HOME/.ndotfiles/git/" 1>&2
  cp $file $HOME/.ndotfiles/git/
done

echo "creating folder $HOME/.ndotfiles/util" 1>&2
mkdir $HOME/.ndotfiles/util/

echo "retrieve the git-credential-netrc from github"
curl -o $HOME/.ndotfiles/util/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
chmod +x $HOME/.ndotfiles/util/git-credential-netrc

echo "adding export GPG_TTY and add git-credential-netrc to PATH in $HOME/.zshrc" 1>&2
echo '
# ===================================================================
# added by https://github.com/newlight77/ndotfiles
export PATH=$HOME/.ndotfiles/util/:$PATH
export GPG_TTY=$(tty)
# ===================================================================
' >> $HOME/.zshrc

echo "writing contents of git/.gitconfig to $HOME/.gitconfig" 1>&2
mv $HOME/.gitconfig                        $HOME/.gitconfig.$(date +"%Y%m%d%H%M%S")
cat ${DIR}/git/.gitconfig               >> $HOME/.gitconfig

echo "*** ------  Customize git Done ------ ***" 1>&2

