#!/usr/bin/env bash

function echoo {
    echo -e "\n\033[32m $1 \033[0m"
}

function backup {
    echoo ">>> Backing up old vim configs"

    today=`date +%Y%m%d`
    for i in $HOME/.vim $HOME/.vimrc; do
        [ -e $i ] && sudo mv $i $i.$today;
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
    echoo "Install finished."
else
    echoo "User cancels the operation."
fi
