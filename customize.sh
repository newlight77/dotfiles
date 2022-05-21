#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd /tmp/bash_custom

DIR=/tmp/bash_custom

mkdir -p ~/.bash_custom

cp  ${DIR}/profile/.bashrc_natelandau   ~/.bash_custom/profile/.bashrc_natelandau
cp  ${DIR}/profile/.bashrc_profile      ~/.bash_custom/profile/.bashrc_profile
cp  ${DIR}/profile/.bashrc_alias        ~/.bash_custom/profile/.bashrc_alias
cp  ${DIR}/profile/.bashrc_ps12         ~/.bash_custom/profile/.bashrc_ps12
cp  ${DIR}/profile/.gitconfig_alias     ~/.bash_custom/profile/.gitconfig_alias
cp  ${DIR}/profile/.bashrc              ~/.bash_custom/profile/.bashrc
cp  ${DIR}/profile/.bashrc_vars         ~/.bash_custom/profile/.bashrc_vars
cp  ${DIR}/profile/.docker_cleanup.sh   ~/.bash_custom/profile/.docker_cleanup.sh

cat ${DIR}/profile/.bashrc_profile    >> ~/.bashrc
cat ${DIR}/profile/.gitconfig         >> ~/.gitconfig

if [ -f ${DIR}/profile/.ssh-config ]; then
  user=$(echo $HOME | cut -d"/"  -f4)
  cat ${DIR}/profile/.ssh-config | sed -e "s/kong/$user/g"  >> ~/.ssh/config
fi

if [ -f ${DIR}/prepare-workspace.sh ]; then
  sh ${DIR}/.bash_custom/profile/prepare-workspace.sh
fi

if [ -f ${DIR}/ssh-copy-id.sh ]; then
  sh ${DIR}/.bash_custom/ssh-copy-id.sh
fi
