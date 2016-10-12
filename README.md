# legolas-vim
个人vim配置。参考帖子：[vim与Python真乃天作之合](http://codingpy.com/article/vim-and-python-match-in-heaven/)

# IDE环境配置

支持Python自动补全的最好插件是YouCompleteMe。而YouCompleteMe需要比较高版本的vim，所以，需要编译安装vim，参见相关文档[1]。另外还需要一些C库，参见相关文档[2]。

vim扩展管理器使用的是Vundle，参见相关文档[3]。

以上部分使用各平台脚本可自动安装。例如，在ubuntu系统上，运行以下命令即可：

    sudo bash init-vim-ubuntu.sh  # 自动编译vim

自动安装插件并编译ycm依赖：

    sudo bash install-plugins.sh init  # init 是用于初始化的

后续更新插件则只需要（自动清理不使用的插件）：

    sudo bash install-plugins.sh


# 快捷键说明

    sv <filename>  # 打开一个文件，纵向分割布局（新文件会在当前文件下方界面打开）
    vs <filename>  # 横向分割布局（新文件会在当前文件右侧界面打开）

    Ctrl-h  # 切换到左侧的分割窗口
    Ctrl-j  # 切换到下方的分割窗口
    Ctrl-l  # 切换到右侧的分割窗口
    Ctrl-k  # 切换到上方的分割窗口

    F2  # 打开or关闭行号
    F7  # flake8 check
    F12  # 打开or关闭复制支持

    Ctrl+t  # 打开or关闭目录树

    space  # 折叠/展开代码

# 相关文档

1. [Building-Vim-from-source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
2. [https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
3. [https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
