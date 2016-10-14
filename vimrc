set nocompatible              " be iMproved, required
set backspace=indent,eol,start
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

" auto check python use pep8
Plugin 'nvie/vim-flake8'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'

" multiple selections
Plugin 'terryma/vim-multiple-cursors'

"" Colorthemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'

" best auto complete tool I have ever used(jedi, supertab...)
Plugin 'Valloric/YouCompleteMe'

" tree explore plugin
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" show venv、git branch、file
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" enhance za
Plugin 'tmhedberg/SimpylFold'

" super search
Plugin 'kien/ctrlp.vim'

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
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

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
" toggle line number
map <F2> :set number!<cR>

" toggle paste
set pastetoggle=<F3>

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


" YouCompleteMe settings
" youcompleteme
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_whitelist = { 'python': 1 }
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ctag and tagbar settings
" toggle tagbar
nnoremap <F8> :UpdateTags<CR>:TagbarToggle<CR>
" open tagbar and jump to corresponding tag
nnoremap <C-G> :TagbarOpen fj<CR>

" auto update tagfile when save
au BufWritePost *.py silent! :UpdateTags

"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
syntax on
let &colorcolumn=80

" Ctrl-j 切换到下方的分割窗口 - Ctrl-k 切换到上方的分割窗口 - Ctrl-l
" 切换到右侧的分割窗口 - Ctrl-h 切换到左侧的分割窗口
"split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" 目录树快捷键
map <C-t> :NERDTreeToggle<CR>
" NERDTree settings
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
" NERDTree git 扩展
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" for powerline
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
let g:Powerline_symbols = 'fancy'

" color scheme
set background=dark        " Assume a dark background
if has('gui_running')
    colorscheme solarized
else
    colorscheme molokai
endif

" 自定义代码折叠，折叠（和取消折叠）
nnoremap <space> za
map <F4> :call ToggleFold()<CR>
let myVarFolded = 1
function! ToggleFold()
  if(g:myVarFolded == 0)
      exec "normal! zM"
      let g:myVarFolded = 1
  else
      exec "normal! zR"
      let g:myVarFolded = 0
  endif
endfunction
