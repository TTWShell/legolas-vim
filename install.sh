#!/usr/bin/env bash

function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

function backup {
    echoo ">>> Backing up old vim configs"

    now=`date +%Y%m%dT%H-%M-%S`
    for i in $HOME/.vim $HOME/.vimrc; do
        echo $i'-->'$i.$now
        [ -e $i ] && sudo mv $i $i.$now;
    done
}

platform=""
for i in "Centos","Centos" "Ubuntu","Ubuntu" "Darwin","MacOSX"; do
	key=${i%,*}; value=${i#*,};
	if [ `python -mplatform | grep -ic  $key` == 1 ]; then
       platform=$value
       echoo "You os is $platform."
    fi
done


read -p "Rebulid the vim and all plugins, Are you sure(Y/N)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    backup
    case $platform in
        Centos)
            sudo bash scripts/init-vim-centos.sh
            ;;
        Ubuntu)
            sudo bash scripts/init-vim-ubuntu.sh
            ;;
        MacOSX)
            bash scripts/init-vim-osx.sh
            echoo ">>> Install fonts for powerline ..."
            bash fonts/install-fonts.sh
    esac
    sudo bash install-plugins.sh init
    echoo "Install finished. If you need orther language support, please run: ./install-plugins.sh --help"
else
    echoo "User cancels the operation."
fi
