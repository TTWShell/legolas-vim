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
" async syntax checking plugin for Vim
Plugin 'w0rp/ale'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'

" multiple selections
Plugin 'terryma/vim-multiple-cursors'

" Colorthemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'

" best auto complete tool I have ever used(jedi, supertab...)
Plugin 'Valloric/YouCompleteMe'

" tree explore plugin
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" show venv、git branch、file
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" enhance za
Plugin 'tmhedberg/SimpylFold'

" super search
Plugin 'kien/ctrlp.vim'

" a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plugin 'mattn/emmet-vim'

" Syntaxes
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'elzr/vim-json'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kylef/apiblueprint.vim'

" A Git wrapper so awesome
Plugin 'tpope/vim-fugitive'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'

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
set nu
set hlsearch
set incsearch

" toggle line number and vim-gitgutter
map <F2> :set number! \| GitGutterToggle<cR>
let g:gitgutter_max_signs = 500  " default value
map <F8> :Glog<cR>
map <F9> :cprev<cR>
map <F10> :cnext<cR>

" toggle paste
set pastetoggle=<F3>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" auto clear whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    endfun
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" deal *.tpl
au BufNewFile,BufRead *.tpl set ft=html

" syntastic
set nocompatible
filetype off
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
let g:ale_sign_column_always = 0 " 一般需要实时检查，默认关闭
let g:ale_lint_on_save = 1 " save file auto check
let g:ale_lint_on_text_changed = 0 " for ale_lint_on_save = 1
let g:ale_lint_on_enter = 0 " for ale_lint_on_save = 1
map <F6> :ALEToggle \| echo 'g:ale_enabled =' g:ale_enabled<CR>

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第0个字符开始补全
let g:ycm_min_num_of_chars_for_completion=0
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
" let g:ycm_filetype_whitelist = { 'python': 1 }
let g:ycm_python_binary_path = 'python'
map <C-G>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  fix .cpp error: ValueError: Still no compile flags, no completions yet.
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Vim's autocomplete is excruciatingly slow
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
syntax on
au BufNewFile,BufRead *
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
\ set list listchars=tab:>-
au BufNewFile,BufRead *.c,*.py
\ set colorcolumn=80
au BufNewFile,BufRead *.go
\ set nolist

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Ctrl-j 切换到下方的分割窗口 - Ctrl-k 切换到上方的分割窗口 - Ctrl-l
" 切换到右侧的分割窗口 - Ctrl-h 切换到左侧的分割窗口
" split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" quick resize split
nnoremap ˙ <C-W><
nnoremap ¬ <C-W>>
nnoremap ∆ <C-W>+
nnoremap ˚ <C-W>-

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" 目录树快捷键
map <F5> :NERDTreeToggle<CR>
" NERDTree settings
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 忽略以下文件的显示
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

" for powerline 已弃用
" set laststatus=2
" set term=xterm-256color
" set termencoding=utf-8
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
" let g:Powerline_symbols = 'fancy'

" for airline
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
let g:airline_theme='dark_minimal'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" 显示buffer编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = '🔥'
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '💦'
" 关于buffer使用：
"     :ls 查看buffer
"     :bn (buffer next)
"     :bp (buffer previous)
"     :b <num> 打开编号为num的buffer

" color scheme
set background=dark        " Assume a dark background
if has('gui_running')
    colorscheme solarized
else
    colorscheme molokai
endif

" 自定义代码折叠，折叠（和取消折叠）
set foldmethod=syntax
set nofoldenable " default unfolded when open file
nnoremap <space> za
map <F4> :call ToggleFold()<CR>
function! ToggleFold()
  if(&foldlevel == '0')
      exec "normal! zR"
  else
      exec "normal! zM"
  endif
  echo "foldlevel:" &foldlevel
endfunction

set cursorline  " 光标横线
set cursorcolumn  " 光标竖线

" Shifting blocks visually
" http://vim.wikia.com/wiki/Shifting_blocks_visually
" Following is a more elaborate set of mappings (mapping Shift-Tab will
" probably only work on gvim)
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" override with your local vimrc
so ~/.vimrc.local
