#!/usr/bin/env bash

function install {
    sudo cp vimrc $HOME/.vimrc
    sudo vim +PluginClean +qall
    sudo vim +PluginInstall +qall
}

function update {
    sudo vim +PluginUpdate +qall
}

function init {
    echo ">>> Set up Vundle ..."
    sudo rm -rf ~/.vim/bundle/Vundle.vim
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    pip install flake8  # for vim-flake8

    install

    sudo mkdir -p ~/.vim/colors && sudo cp ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

    rebuild --gocode-completer
}

function rebuild() {
    cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && sudo ./install.py "$@"
}

function usage {
    printf "Usage:\n"
    printf "    init\t初始化安装插件\n"
    printf "    install\t安装新增变更配置\n"
    printf "    update\t更新配置且更新所有插件。可能会导致ycm不能正常工作，此时需要执行 rebuild 命令\n"
    printf "    rebuild\trebuild YouCompleteMe。可加YCM build的参数，例如：-clang-completer --gocode-completer\n"
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
