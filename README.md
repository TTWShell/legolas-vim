# legolas-vim
个人vim配置。参考帖子：[vim与Python真乃天作之合](http://codingpy.com/article/vim-and-python-match-in-heaven/)

支持Python自动补全的最好插件是YouCompleteMe。而YouCompleteMe需要比较高版本的vim(>=7.4.143)，所以，需要编译安装vim，参见相关文档[1]。另外还需要一些C库，参见相关文档[2]。

vim扩展管理器使用的是Vundle，参见相关文档[3]。

由于是为python开发打造。默认安装了pip等py开发必需品。公用开发工具默认安装（brew、zsh等）。


# 自己的Vim-IDE 

**支持Ubuntu（自动编译最新版vim）、centos（默认使用系统自带vim，用户可能需要自行升级，可参考ubuntu脚本）、Mac OSX（默认基于brew安装新版vim）**，一键安装：

    cd ~ && rm -rf legolas-vim && git clone https://github.com/TTWShell/legolas-vim.git && cd legolas-vim && bash install.sh

如果用户修改了vimrc配置文件，运行以下命令更新即可：

    sudo bash install-plugins.sh


# 问题集锦

1. 安装过程中打开vim可能会提示找不到syntax.vim或者配色。syntax做一下ln s 操作即可。配色安装完毕会自动解决。

2. mac上有好用的brew。可以直接安装8.0以上版本的vim。可参考[Mac环境配置及python包安装的那些坑](http://www.ttwshell.com/article/mac-env-and-python-package-install-errors.html)：

        brew update
        export "PATH=/usr/local/bin:$PATH"  # 在／etc/profile 添加一下语句（使用zsh的在~/.zshrc添加即可）

3. mac由于并没有直接替换系统自带的vim。所以其他需要vim支持的工具需要修改配置。例如git：

        git config --global core.editor "/usr/local/bin/vim"

4. 关于字体

    [powerline-fonts](https://github.com/powerline/fonts)已经去掉了monaco_for_powerline。但是iterm2默认字体monaco非常好看，为了使用monaco并解决特殊符号乱码问题，所以Backup了一份。会自动安装。


# 快捷键说明

    # NERDTree 有按横向纵向布局模式打开文件的快捷，直接看help信息即可
    sv <filename>  # 打开一个文件，纵向分割布局（新文件会在当前文件下方界面打开）
    vs <filename>  # 横向分割布局（新文件会在当前文件右侧界面打开）

    Ctrl-h  # 切换到左侧的分割窗口
    Ctrl-j  # 切换到下方的分割窗口
    Ctrl-l  # 切换到右侧的分割窗口
    Ctrl-k  # 切换到上方的分割窗口
    Ctrl-g  # 打开tagbar并且光标定位到相应的tag

    tab 切换使用ngt即可。例如切换到第二个tab页，输入2gt。

    F2  # 打开or关闭行号
    F3  # 打开or关闭复制支持
    F4  # 折叠or展开代码
    F7  # flake8 check
    F8  # 打开or关闭函数列表

    Ctrl-t  # 打开or关闭目录树

    space  # 折叠/展开代码

    Shift-i  # 目录是否显示隐藏文件（NERDTree）。便于git开发，默认永远不显示.git。


# 相关文档

1. [Building-Vim-from-source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
2. [https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
3. [https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
