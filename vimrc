" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" async syntax checking plugin for Vim
"""""""""""""""""""""""""""""""""""""""""""""
"           personal plugin start           "
"""""""""""""""""""""""""""""""""""""""""""""
" async syntax checking plugin for Vim
Plug 'w0rp/ale', {'tag': 'b934dc5'}

" Highlights trailing whitespace in red and provides
Plug 'bronson/vim-trailing-whitespace'

" multiple selections
Plug 'terryma/vim-multiple-cursors'

" Colorthemes
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'

" best auto complete tool I have ever used(jedi, supertab...)
Plug 'Valloric/YouCompleteMe', {'tag': 'e018777'}

" tree explore plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show venv、git branch、file
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" enhance za
Plug 'tmhedberg/SimpylFold'

" super search
Plug 'kien/ctrlp.vim'

" a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'

" Syntaxes
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'othree/html5.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'fatih/vim-go'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'elzr/vim-json'
Plug 'dyng/ctrlsf.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'leafgarland/typescript-vim'

" A Git wrapper so awesome
Plug 'tpope/vim-fugitive'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()
filetype plugin indent on
syntax enable
syntax on

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

set nocompatible
set backspace=indent,eol,start
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
let &runtimepath.=',~/.vim/plugged/ale'
let g:ale_sign_column_always = 0 " 一般需要实时检查，默认关闭
let g:ale_lint_on_save = 1 " save file auto check
let g:ale_lint_on_text_changed = 0 " for ale_lint_on_save = 1
let g:ale_lint_on_enter = 0 " for ale_lint_on_save = 1
map <F6> :ALEToggle \| echo 'g:ale_enabled =' g:ale_enabled<CR>
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第1个字符开始补全 @2018-07-19 改为1，否则移动光标会弹出一堆无意义的提示
let g:ycm_min_num_of_chars_for_completion=1
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
let g:ycm_python_binary_path = 'python3'
map <C-G>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  fix .cpp error: ValueError: Still no compile flags, no completions yet.
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Vim's autocomplete is excruciatingly slow
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

"""""""""""""""""""""""""""""""""""""""""""""
"              Vim UI                       "
"""""""""""""""""""""""""""""""""""""""""""""
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
au BufNewFile,BufRead *.yml
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

"python with virtualenv support
if has('python3')
  silent! python3 1
endif
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
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
set t_Co=256

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
