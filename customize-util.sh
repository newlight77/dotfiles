#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom

rm -r $DIR
git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR


mkdir -p $HOME/.bash_custom/util

cp  ${DIR}/util/convert2iso.sh                     $HOME/.bash_custom/util/convert2iso.sh
cp  ${DIR}/util/docker_cleanup.sh                  $HOME/.bash_custom/util/docker_cleanup.sh
cp  ${DIR}/util/prepare-workspace.sh               $HOME/.bash_custom/util/prepare-workspace.sh
cp  ${DIR}/util/ssh-agent.sh                       $HOME/.bash_custom/util/ssh-agent.sh
cp  ${DIR}/util/ssh-copy-id.sh                     $HOME/.bash_custom/util/ssh-copy-id.sh
