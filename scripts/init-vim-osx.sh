#!/usr/bin/env bash
# Init vim in Mac OSX
function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

echoo ">>> Install cmake using brew ..."
brew install cmake

echoo ">>> Install golang using brew ..."
brew install golang

echoo ">>> Install vim using brew ..."
brew install vim

echoo ">>> Install ctags using brew ...(for tarlist)"
brew install ctags
