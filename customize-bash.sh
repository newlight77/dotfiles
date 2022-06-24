#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom
cd $DIR

mkdir -p $HOME/.bash_custom/bash

cp  ${DIR}/bash/.bashrc                     $HOME/.bash_custom/bash/.bashrc
cp  ${DIR}/bash/.bashrc_alias               $HOME/.bash_custom/bash/.bashrc_alias
cp  ${DIR}/bash/.bashrc_docker              $HOME/.bash_custom/bash/.bashrc_docker
cp  ${DIR}/bash/.bashrc_fs                  $HOME/.bash_custom/bash/.bashrc_fs
cp  ${DIR}/bash/.bashrc_general             $HOME/.bash_custom/bash/.bashrc_general
cp  ${DIR}/bash/.bashrc_macos               $HOME/.bash_custom/bash/.bashrc_macos
cp  ${DIR}/bash/.bashrc_network             $HOME/.bash_custom/bash/.bashrc_network
cp  ${DIR}/bash/.bashrc_ps12                $HOME/.bash_custom/bash/.bashrc_ps12
cp  ${DIR}/bash/.bashrc_search              $HOME/.bash_custom/bash/.bashrc_search
cp  ${DIR}/bash/.bashrc_vars                $HOME/.bash_custom/bash/.bashrc_vars

cat ${DIR}/bash/.bashrc                  >> $HOME/.bashrc
cat ${DIR}/bash/.bashrc                  >> $HOME/.zprofile

echo "*** ------  Customize Bash Done ------ ***" 1>&2
