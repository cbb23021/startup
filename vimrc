" --------------------------------------------------

"   #############
"  ### Basic ###
" #############

" --------------------------------------------------
" Have faster interaction(default: 4000 ms)
set updatetime=750
" Disable error bells
set noerrorbells
" Line number on cursor and relative number on the other lines
set number relativenumber
" Disable wrapping line when the text too long
set nowrap
" case insensitive
set ignorecase
" Useful during searching case insensitive if not use uppercase
set smartcase
" Disable swapfile
set noswapfile
" Disable backup instead of set undo profile
set nobackup
" Highlight cursor
set cursorline
" Highlight ruler
set colorcolumn=120
" Enable incremental search
set incsearch
" Better backspace reaction
set backspace=indent,eol,start
" Share clipboard with MacOS
set clipboard=unnamed,unnamedplus
" Enable mouse mode
set mouse=v
" Enable spelling Check
set spell
" Sepll dictionary, set cjk to exclude Asian character check
set spelllang+=en_us,cjk
" Disable quote concealing in JSON files
let g:vim_json_conceal=0

"set pastetoggle=<leader>p
set nocompatible
set ruler
set showcmd
set incsearch
set formatoptions+=r
set fileformat=unix
set encoding=utf-8
let mapleader = "\<NUL>"
filetype plugin on
" --------------------------------------------------

"   ##############
"  ### Syntax ###
" ##############

" --------------------------------------------------
syntax on
let g:python_highlight_all = 1
" --------------------------------------------------
" Expand terminal color range, $echo term "screen-256color" >> ~/.screenrc
" --------------------------------------------------
if has("termguicolors")
    set termguicolors
endif
" --------------------------------------------------
" Python white space hint
" --------------------------------------------------
" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead, BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
autocmd BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\ $/
" 顯示行末空白符號
set list listchars=tab:»·,trail:·
" --------------------------------------------------
" Personal shortcut
" --------------------------------------------------
" Map Escape key as 'jj'
inoremap jj <Esc>
" Map Redo key as 'U'
nnoremap <S-U> <C-R>
" Goto definition
nnoremap <MiddleMouse> <C-]>
nnoremap <C-MiddleMouse> <C-T>
" Movement between window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Adjust window size by shift + (arrow keys)
nnoremap <silent> <S-Up> :resize +5<CR>
nnoremap <silent> <S-Down> :resize -5<CR>
nnoremap <silent> <S-Left> :vertical resize -5<CR>
nnoremap <silent> <S-Right> :vertical resize +5<CR>
" Handle Input Movement
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
inoremap <C-H> <Left>
" Toggle scroll binding
nnoremap <F5> :set scrollbind<CR>
nnoremap <S-F5> :set noscrollbind<CR>
" global search
map <C-F> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" --------------------------------------------------
" Indentation(Tab)
" - indent: Tab
" - outdent: Shift + Tab
" --------------------------------------------------
filetype indent on
set smarttab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4
"set softtabstop=4
"set tabstop=4
"set expandtab
inoremap <silent> <S-Tab> <C-D>
vnoremap <silent> <Tab> >gV
vnoremap <silent> <S-Tab> <gV
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<
" --------------------------------------------------
"  setup for different files
" --------------------------------------------------
autocmd FileType python setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType java setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType php setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType shell setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType go setlocal ts=4 sw=4
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType yaml setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType markdown setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType json setlocal ts=4 sw=4 autoindent expandtab
autocmd FileType sh setlocal ts=4 sw=4 autoindent expandtab
" --------------------------------------------------
" Fold Block
" --------------------------------------------------
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" --------------------------------------------------
" Netrw
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:NetrwIsOpen=0
let g:netrw_browse_split = 4
" --------------------------------------------------


"   ###################
"  ### PlugInstall ###
" ###################
"
call plug#begin('~/.vim/bundle')
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" --------------------------------------------------
set background=dark
highlight Comment cterm=bold
" --------------------------------------------------
" Python 渲染
Plug 'sentientmachine/Pretty-Vim-Python'
" --------------------------------------------------
" Python 語法標示增強
Plug 'vim-python/python-syntax'
" --------------------------------------------------
" 完整的 VIM - Python 環境
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
" F8 PEP8 排版
nnoremap <F8> :PymodeLintAuto<CR>
" F10 運行當前文件
let g:pymode_run_bind = '<F10>'
" 僅使用PEP8檢查
let g:pymode_lint_checkers = ['pep8']
" 禁用存擋時檢查
let g:pymode_lint_on_write = 0
" 設定最大長度為119
let g:pymode_options_max_line_length = 119
" 客製化PEP8設定
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
" 禁用PEP8 79字數提示
let g:pymode_options_colorcolumn = 0
" 禁用PEP8 79自動換行
let g:pymode_indent = 0
" 禁用PEP8 79自動換行
let g:pymode_python = 'python3'
" --------------------------------------------------
" Jedi 補全
Plug 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0  " use buffers instead of tabs
let g:jedi#show_call_signatures = '1'
let g:jedi#goto_command = '<C-]>'
let g:jedi#goto_assignments_command = '<leader>ga'
let g:jedi#goto_definitions_command = '<leader>gd'
let g:jedi#goto_stubs_command = '<leader>gs'
let g:jedi#documentation_command = '<F1>'
let g:jedi#usages_command = '<leader>u'
let g:jedi#rename_command = '<leader>r'
" --------------------------------------------------
" 縮進輔助線
" IndentLinesToggle
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" --------------------------------------------------
" 華麗的狀態列
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
set t_Co=256
" --------------------------------------------------
" 資料夾瀏覽
Plug 'scrooloose/nerdtree'
"autocmd VimEnter * NERDTree
nnoremap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['^node_modules$', '/.pyc$', '/.pyo$', '^__pycache__$']
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
set modifiable
" --------------------------------------------------
" 快速註解
Plug 'preservim/nerdcommenter'
map <C-_> <leader>c<space>
" --------------------------------------------------
" Undo 紀錄
Plug 'mbbill/undotree'
set undofile
set undodir=~/.vim-undo-cache
nnoremap <F2> :UndotreeToggle<CR>
" --------------------------------------------------
" 主題選擇器
Plug 'c9s/colorselector.vim'
nnoremap <F11> :SelectColorS<CR>
" --------------------------------------------------
" 將同一推進視為物件，如括弧內的物件操作
Plug 'michaeljsmith/vim-indent-object'
" 括號對稱修正取代，反白字增加對稱括號
Plug 'tpope/vim-surround'
" 渲染 Markdown
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" --------------------------------------------------
" 全局遞迴搜尋
Plug 'mileszs/ack.vim'
" Ack.vim
let g:ackhighlight = 1
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" --------------------------------------------------
" Tab 補齊
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
" --------------------------------------------------
" 補齊顯示設定
set completeopt=menuone,longest,preview
" --------------------------------------------------
" Python 縮進
Plug 'jeetsukumaran/vim-pythonsense'
" --------------------------------------------------
" 全局文件搜尋(改進版)
Plug 'ctrlpvim/ctrlp.vim'
" ctrlp
" <leader>f   # 模糊搜索当前目录及其子目录下的所有文件
" <leader>p   # 模糊搜索最近打开的文件(MRU)
" ctrl + j/k  # 进行上下选择
" ctrl + x    # 在当前窗口水平分屏打开文件
" ctrl + v    # 同上, 垂直分屏
" ctrl + t    # 在tab中打开
" F5          # 刷新可搜索文件
" <c-d>       # 只能搜索全路径文件
" <c-r>       # 可以使用正则搜索文件
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
map <leader>p :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|rvm)$', 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'}
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" --------------------------------------------------
" 搜尋方法名稱
Plug 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
" --------------------------------------------------
" Git 輔助
Plug 'tpope/vim-fugitive'
" :Gstatus = git status
"   "-" stage/unstage changes
"   "cc" to call :Gcommit
" :Gwrite = git add
" :Gread = git checkout
" :Gedit get current index
" :Gdiff = git diff
" :Gblame = git blame
" :Gmove = git mv
" :Gdelete = git rm
" --------------------------------------------------
" Git Blame
Plug 'zivyangll/git-blame.vim'
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
" --------------------------------------------------
" HTML Emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,js,ts EmmetInstall
let g:user_emmet_leader_key='<C-Y>'
" --------------------------------------------------
" 查閱系統說明文件(e.g. :Man echo)
Plug 'vim-utils/vim-man'
" --------------------------------------------------
" syntax 檢查
"Plug 'vim-syntastic/syntastic'
" --------------------------------------------------
" 主題
Plug 'morhetz/gruvbox'
" --------------------------------------------------
" markdown preview
Plug 'MichaelMure/mdr'
Plug 'skanehira/preview-markdown.vim'
" --------------------------------------------------
call plug#end()

let g:gruvbox_italic=1
colorscheme gruvbox
" --------------------------------------------------
" Golang
nnoremap <C-g> :!clear; go run %<CR>
nnoremap <C-p> :!clear; python %<CR>
" ==================================================
" Vimscript NetrwToggle <leader><leader>
" --------------------------------------------------
"function! NetrwToggle()
    "if g:NetrwIsOpen
        "let i = bufnr("$")
        "while (i >= 1)
            "if (getbufvar(i, "&filetype") == "netrw")
                "silent exe "bwipeout " . i 
            "endif
            "let i-=1
        "endwhile
        "let g:NetrwIsOpen=0
    "else
        "let g:NetrwIsOpen=1
        "silent Lexplore
    "endif
"endfunction
"noremap <silent> <leader><leader> :call NetrwToggle()<CR>
" ==================================================
" Vimscript CopyModeToggle <F3>
" --------------------------------------------------
" wrap line, disable number, disable IndentLines
let s:copy_mode = "F"
function! CopyModeToggle()
    if (s:copy_mode ==? "T")
        let s:copy_mode = "F"
        set nu
        set rnu
        set nowrap
        IndentLinesEnable
    else
        let s:copy_mode = "T"
        set nonu
        set nornu
        set wrap
        IndentLinesDisable
    endif
endfunction
nnoremap <silent> <F3> :call CopyModeToggle()<CR>
" ==================================================
" Vimscript ThemeToggle <F4>
" --------------------------------------------------
let s:bg_mode = "dark"
function! BgToggle()
    if (s:bg_mode ==? "light")
        set background=dark
        let s:bg_mode = "dark"
    else
        set background=light
        let s:bg_mode = "light"
    endif
endfunction
nnoremap <silent> <F4> :call BgToggle()<CR>

