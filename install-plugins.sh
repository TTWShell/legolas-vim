#!/usr/bin/env bash

function update {
    cp vimrc $HOME/.vimrc
    sudo vim +PluginClean +qall
    sudo vim +PluginInstall +qall
}

function init {
    echoo ">>> Set up Vundle ..."
    sudo rm -rf ~/.vim/bundle/Vundle.vim
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    pip install flake8  # for vim-flake8

    update;

    sudo mkdir -p ~/.vim/colors && sudo cp ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

    cd ~/.vim/bundle/YouCompleteMe && sudo ./install.py --clang-completer
}


if [[ $1 = "init" ]]; then
    init;
else
    update;
fi

