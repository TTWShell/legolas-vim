#!/usr/bin/env bash


function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}


cp vimrc $HOME/.vimrc

sudo vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe && sudo ./install.py --clang-completer

