#!/usr/bin/env bash
# Init vim in Ubuntu
function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

# backup
echoo ">>> Backing up old vim configs"

today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do 
    [ -e $i ] && sudo mv $i $i.$today; 
done


echoo ">>> install vim use brew..."
brew install vim

echoo ">>> Set up Vundle..."
sudo rm -rf ~/.vim/bundle/Vundle.vim
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
