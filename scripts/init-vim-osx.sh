#!/usr/bin/env bash
# Init vim in Mac OSX
function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

echoo ">>> Install cmake using brew ..."
brew list cmake &>/dev/null || brew install cmake

echoo ">>> Install golang using brew ..."
brew list golang &>/dev/null || brew install golang

echoo ">>> Install vim using brew ..."
brew list vim &>/dev/null || brew install vim
