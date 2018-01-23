#!/usr/bin/env bash
set -e
set -o pipefail

function echoo {
    echo -e "\033[32m $1 \033[0m"
}

if [[ $1 != "INIT" ]]; then
    echoo "if need install or reinstall legolas-vim, please run: ./install.sh INIT"
    exit 1
fi

function backup {
    echoo ">>> Backing up old vim configs"

    now=`date +%Y%m%dT%H-%M-%S`
    for i in $HOME/.vim $HOME/.vimrc; do
        echoo $i' --> '$i.$now
        [ -e $i ] && sudo mv $i $i.$now
    done

    echoo ">>> backup finished"
}

result=`python -mplatform`
platform=""
for i in "Centos","Centos" "Ubuntu","Ubuntu" "Debian","Debian" "Darwin","MacOSX"; do
    key=${i%,*}; value=${i#*,};
    if [ `grep -ic $key <<< ${result}` == 1 ]; then
       platform=$value
       echoo ">>> Your os is $platform."
       break
    fi
done


backup

case $platform in
    Centos)
        sudo bash scripts/init-vim-centos.sh
        ;;
    Ubuntu|Debian)
        sudo bash scripts/init-vim-ubuntu.sh
        ;;
    MacOSX)
        echoo ">>> Install dependencies ..."
        bash scripts/init-vim-osx.sh
        echoo ">>> Install fonts for powerline ..."
        bash fonts/install-fonts.sh
        ;;
    *)
        echoo "暂不支持此系统，欲使用此配置，需要先解决依赖安装的问题，欢迎提pr。result: ${result}"
        exit 1
        ;;
esac

bash install-plugins.sh init

echoo "Install finished. If you need orther language support, please run: ./install-plugins.sh --help"
