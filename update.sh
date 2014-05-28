#!/bin/zsh

set -e # quit if merge fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

git pull
git submodule init
git submodule update
git submodule foreach git pull origin master

./symlink.sh -y
