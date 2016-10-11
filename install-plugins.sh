#!/usr/bin/env bash

function update {
    cp vimrc $HOME/.vimrc
    sudo vim +PluginInstall +qall
}

function init {
    update;
    cd ~/.vim/bundle/YouCompleteMe && sudo ./install.py --clang-completer
}


if [[ $1 = "init" ]]; then
    init;
else
    update;
fi

