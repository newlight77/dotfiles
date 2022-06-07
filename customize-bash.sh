#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom

rm -r $DIR
git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR

mkdir -p $HOME/.bash_custom/profile/util

cp  ${DIR}/profile/.bashrc                     $HOME/.bash_custom/profile/.bashrc
cp  ${DIR}/profile/.bashrc_alias               $HOME/.bash_custom/profile/.bashrc_alias
cp  ${DIR}/profile/.bashrc_docker_cleanup      $HOME/.bash_custom/profile/.bashrc_docker_cleanup
cp  ${DIR}/profile/.bashrc_natelandau          $HOME/.bash_custom/profile/.bashrc_natelandau
cp  ${DIR}/profile/.bashrc_profile             $HOME/.bash_custom/profile/.bashrc_profile
cat ${DIR}/profile/.bashrc_profile          >> $HOME/.bashrc
cat ${DIR}/profile/.bashrc_profile          >> $HOME/.zprofile
cp  ${DIR}/profile/.bashrc_ps12                $HOME/.bash_custom/profile/.bashrc_ps12
cp  ${DIR}/profile/.bashrc_vars                $HOME/.bash_custom/profile/.bashrc_vars

cat ${DIR}/profile/.gitconfig               >> $HOME/.gitconfig
cp  ${DIR}/profile/.gitconfig_alias            $HOME/.bash_custom/profile/.gitconfig_alias

cp  ${DIR}/profile/.poetry.env                 $HOME/.bash_custom/profile/.poetry.env

if [ -f ${DIR}/profile/.ssh-config ]; then
  user=$(echo $HOME | cut -d"/"  -f4)
  cat ${DIR}/profile/.ssh-config | sed -e "s/kong/$user/g"  >> $HOME/.ssh/config
fi

cp  ${DIR}/profile/util/docker_cleanup.sh      $HOME/.bash_custom/profile/util/docker_cleanup.sh
cp  ${DIR}/profile/util/prepare-workspace.sh   $HOME/.bash_custom/profile/util/prepare-workspace.sh
cp  ${DIR}/profile/util/ssh-agent.sh           $HOME/.bash_custom/profile/util/ssh-agent.sh
cp  ${DIR}/profile/util/ssh-copy-id.sh         $HOME/.bash_custom/profile/util/ssh-copy-id.sh
