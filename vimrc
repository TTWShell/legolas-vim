set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""
"           personal plugin start           "
"""""""""""""""""""""""""""""""""""""""""""""
" Syntastic is a syntax checking plugin for Vim
Plugin 'scrooloose/syntastic'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'

" multiple selections
Plugin 'terryma/vim-multiple-cursors'

"" Colorthemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Syntaxes
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'cstrahan/vim-capnp'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/html5.vim'
Plugin 'saltstack/salt-vim'
Plugin 'tshirtman/vim-cython'
Plugin 'vim-scripts/nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'unblevable/quick-scope'
Plugin 'elzr/vim-json'
Plugin 'dyng/ctrlsf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc


set encoding=utf-8
set fencs=utf-8,gb2312,gbk     " Sets the default encoding
filetype plugin indent on      " Automatically detect file types.
set nu

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null


" syntastic
    " check when open file
    let g:syntastic_check_on_open = 1
    " let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_checkers = ['flake8']
    " ignore pep8 character lenght limit
    let g:syntastic_python_flake8_args = '--ignore=E402'
    " jump the cursor to the first detected issue
    " let g:syntastic_auto_jump=1
    let g:syntastic_mode_map = {
                \ "mode": "passive",
                \ "active_filetypes": ["python"],
                \ "passive_filetypes": []}


"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
syntax on

" ignore compiled files
set wildignore=*.o,*~,*.pyc

set background=dark        " Assume a dark background
if has('gui_running')
    colorscheme solarized
else
    colorscheme molokai
endif
