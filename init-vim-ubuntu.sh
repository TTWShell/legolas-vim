#!/usr/bin/env bash
# Init vim in Ubuntu
function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

# backup
echoo ">>> Backing up old vim configs"

today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do 
    [ -e $i ] && mv $i $i.$today; 
done


# clone vim
echoo ">>> Building Vim from source: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source"

echoo ">>> First, install all the prerequisite libraries, including Git..."
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev build-essential cmake git

echoo ">>> Remove vim if you have it already..."
sudo apt-get remove vim vim-runtime gvim

echoo ">>> install vim..."
cd ~ && rm -rf vim && git clone https://github.com/vim/vim.git && cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp \
            --enable-python3interp \
            --with-mac-arch=x86_64 \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install

echoo ">>> Set up Vundle..."
sudo rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echoo "SUCCESS"
