#!/usr/bin/env bash


function echoo {
    echo -e "\n\033[32m $1 \033[0m"
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
    case $platform in
        Centos)
            sudo bash scripts/init-vim-centos.sh
            ;;
        Ubuntu)
            sudo bash scripts/init-vim-ubuntu.sh
            ;;
        MacOSX)
echo "ssss"
            bash scripts/init-vim-osx.sh
    esac
    sudo bash install-plugins.sh init
    echoo "Install finished."
else
    echoo "The user cancels the operation."
fi
