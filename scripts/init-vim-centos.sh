#!/usr/bin/env bash

# for ycm
yum install -y gcc gcc-c++ kernel-devel cmake golang

sudo yum -y remove vim

cd ~ && rm -rf vim && git clone https://github.com/vim/vim.git && cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
