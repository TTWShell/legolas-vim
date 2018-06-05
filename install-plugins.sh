#!/usr/bin/env bash

function install {
    ln -s -f `pwd`/vimrc  $HOME/.vimrc
    touch $HOME/.vimrc.local
    yes "" | vim +PlugClean +qall
    yes "" | vim +PlugInstall +qall
}

function update {
    yes "" | vim +PlugUpdate +qall
    yes "" | vim +PlugUpgrade +qall
}

function init {
    echo ">>> Set up plug.vim ..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    sudo pip install flake8  # for vim-flake8

    install

    mkdir -p ~/.vim/colors && cp ~/.vim/plugged/vim-colorschemes/colors/* ~/.vim/colors

    rebuild --gocode-completer
}

function rebuild() {
    cd ~/.vim/plugged/YouCompleteMe && git submodule update --init --recursive && python3 install.py "$@"
}

function usage {
    printf "Usage:\n"
    printf "    init\t初始化安装插件\n"
    printf "    install\t安装新增变更配置\n"
    printf "    update\t更新配置且更新所有插件。可能会导致ycm不能正常工作，此时需要执行 rebuild 命令\n"
    printf "    rebuild\trebuild YouCompleteMe。可加YCM build的参数，例如：--clang-completer --gocode-completer\n"
}


Action=$1
shift
case "$Action" in
    init)
        init "$@"
        ;;
    update)
        install
        update
        ;;
    install)
        install
        ;;
    rebuild)
        rebuild "$@"
        ;;
    *)
        usage
        exit 1
        ;;
esac
exit 0
