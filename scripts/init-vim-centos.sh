#!/usr/bin/env bash

# for ycm
yum install -y gcc gcc-c++ kernel-devel cmake golang

sudo yum -y remove vim

cd ~ && rm -rf vim && git clone git@github.com:vim/vim.git && cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp \
            #--with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp \
            #--with-python3-config-dir=/usr/lib/python3.4/config \
            --with-mac-arch=x86_64 \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
