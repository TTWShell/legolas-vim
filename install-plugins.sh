#!/usr/bin/env bash

function update {
    cp vimrc $HOME/.vimrc
    sudo vim +PluginClean +qall
    sudo vim +PluginInstall +qall
}

function init {
    pip install flake8  # for vim-flake8
    update;
    cd ~/.vim/bundle/YouCompleteMe && sudo ./install.py --clang-completer
}


if [[ $1 = "init" ]]; then
    init;
else
    update;
fi

