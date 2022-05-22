#!/usr/bin/env bash


#############################################
## Global variables
#############################################
BASE_DIR=$(dirname $0)
ROOT_DIR="$(cd $BASE_DIR/../.. && pwd -P)"
echo "${green} ROOT_DIR: $ROOT_DIR ${reset}"


FULL_CLEANUP=false


#############################################
## Functions
#############################################


usage() {
  echo "Usage: $0 [options]"
  echo ""
  echo "${blue}Options:    ${reset}"
  echo "${blue}          -f, --full-cleanup         full cleanup including containers, images and volumes ${reset}"
  echo "${blue}          -h,  --help                help ${reset}"
  echo "${blue}                                          ${reset}"
  echo "${blue}By default, this will clean stop all containers and destroy them, remove all untagged and stagging images and all stagging volumes ${reset}"
  exit 1
}

cleanContainers() {
    containers=$(docker ps -q)
    if [ "$containers" != "" ]; then
        echo "killing all containers"
        docker kill $(docker ps -q)
    else
       echo "there is no running container"
    fi
}

cleanAllContainers() {
    containers=$(docker ps -aq)
    if [ "$containers" != "" ]; then
        echo "removing all containers"
        docker rm -f $(docker ps -a -q)
    else
       echo "there is no container"
    fi
}

cleanImages() {
    images=$(docker images -q -f dangling=true)
    if [ "$images" != "" ]; then
        echo "removing all dangling images"
        docker rmi $(docker images -q -f dangling=true)
    else
        echo "there is no dangling image to be removed"
    fi
}

cleanAllImages() {
    images=$(docker images -q)
    if [ "$images" != "" ]; then
        echo "removing all images"
        docker rmi $(docker images -q)
    else
        echo "there is no image to be removed"
    fi
}

cleanVolumes() {
    volumes=$(docker volume ls -q -f dangling=true)
    if [ "$volumes" != "" ]; then
        echo "removing all dangling volumes"
        docker volume rm $(docker volume ls -q -f dangling=true)
    else
        echo "there is no dangling volume to be removed"
    fi
}

cleanAllVolumes() {
    volumes=$(docker volume ls -q)
    if [ "$volumes" != "" ]; then
        echo "removing all volumes"
        docker volume rm $(docker volume ls -q)
    else
        echo "there is no volume to be remove"
    fi
}


#############################################
## Check arguments
#############################################
for i in "$@"
  do
    case $i in
      -f|--full-cleanup)       FULL_CLEANUP="true"     ;;
      -h|--help)                   usage               ;;
      *)                           usage               ;;
    esac
done


#############################################
## Run
#############################################

#cleanContainers
#cleanAllContainers
#cleanImages
#cleanAllImages
#cleanVolumes
#cleanAllVolumes
