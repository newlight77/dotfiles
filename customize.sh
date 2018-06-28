#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

if [ ! -d ~/.bash_custom/.bash-it ]; then
  git clone https://github.com/Bash-it/bash-it.git ~/.bash_custom/.bash-it
fi

# if [ ! -d ~/.bash-git-prompt ]; then
#   git clone https://github.com/magicmonty/bash-git-prompt.git  ~/.bash_custom/.bash-git-prompt
# fi
#
# if [ ! -f ~/.git-completion.bash ]; then
#   curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.bash_custom/.git-completion.bash
# fi
#
# if [ ! -d ~/.bash-completion ]; then
#   curl -L https://raw.githubusercontent.com/scop/bash-completion/master/bash_completion -o  ~/.bash_custom/.bash-completion
# fi

mkdir -p ~/.bash_custom
cp  ${DIR}/profile/.bashrc_natelandau ~/.bash_custom/.bashrc_natelandau
cp  ${DIR}/profile/.bashrc_profile    ~/.bash_custom/.bashrc_profile
cp  ${DIR}/profile/.bashrc_alias      ~/.bash_custom/.bashrc_alias
cp  ${DIR}/profile/.bashrc_ps12       ~/.bash_custom/.bashrc_ps12
cp  ${DIR}/profile/.gitconfig_alias   ~/.bash_custom/.gitconfig_alias
cp  ${DIR}/profile/.bashrc            ~/.bash_custom/.bashrc
cp  ${DIR}/profile/.bashrc_vars       ~/.bash_custom/.bashrc_vars

cat ${DIR}/profile/.bashrc_profile    >> ~/.bashrc
cat ${DIR}/profile/.gitconfig         >> ~/.gitconfig

if [ ! -f ${DIR}/profile/.ssh-config ]; then
  user=$(echo $HOME | cut -d"/"  -f4)
  cat ${DIR}/profile/.ssh-config | sed -e "s/KT5D4F1N/$user/g"  >> ~/.ssh/config
fi

if [ ! -f ${DIR}/ssh-copy-id.sh ]; then
  sh ${DIR}/ssh-copy-id.sh
fi

if [ ! -f ${DIR}/prepare-workspace.sh ]; then
  sh ${DIR}/prepare-workspace.sh
fi
