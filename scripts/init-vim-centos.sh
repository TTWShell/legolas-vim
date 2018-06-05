#!/usr/bin/env bash

# for ycm
yum install -y gcc gcc-c++ kernel-devel cmake golang

sudo yum -y remove vim

cd ~ && rm -rf vim && git clone git@github.com:vim/vim.git && cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    #--enable-pythoninterp=yes \
    #--with-python-config-dir=/usr/lib/python2.7/config \
    #--enable-python3interp=yes \
    #--with-python3-config-dir=/usr/lib/python3.6/config \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
