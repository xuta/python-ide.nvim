""" General

let g:is_mac = has('macunix')
let g:is_linux = has('unix') && !has('macunix')
let g:nvim_system_wide = 0

let mapleader = " " 
let g:mapleader = " "

if $TERM == "xterm-256color"
    set termguicolors
endif
set background=dark

set noswapfile
set nobackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set ignorecase smartcase

set fileencoding=utf-8
scriptencoding utf-8

set linebreak
set showbreak=↪
set nofoldenable
set breakindent
set wrap

set cursorline
set colorcolumn=99
set scrolloff=6

set mouse=a

set noshowmode  " airline shows mode already

set confirm
set visualbell noerrorbells
set history=1000
set autowrite

set shortmess+=c

set splitright
set splitbelow
set wildmenu

set hlsearch
set incsearch


""" Mapping

" move to end of line in insert mode
inoremap <C-e> <C-o>$  " <C-o> to switch to normal mode for one command

" close file
nmap <C-w> :q<cr>

" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move splitted windows
nnoremap <C-h>h <C-w>H
nnoremap <C-j>j <C-w>J

" Remove all trailing whitespace by pressing C-s
nnoremap <C-s> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


""" Vim-plug
let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')

call plug#begin(g:PLUGIN_HOME)

" sorry NerdTree, you're good, but ranger is the best
Plug 'rbgrouleff/bclose.vim'  " required by ranger.vim'
Plug 'francoiscabrol/ranger.vim'
" Plug 'iberianpig/ranger-explorer.vim'  " TODO: delete

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" highlighting
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" handy editor
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'terryma/vim-multiple-cursors'

" status line, color and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'lifepillar/vim-gruvbox8'

if executable('ctags')
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpen'] }
endif

Plug 'skywind3000/asyncrun.vim'

call plug#end()


""" Plugins setting


"" ranger
let g:NERDTreeHijackNetrw = 0  " add this line if you use NERDTree
let g:ranger_replace_netrw = 1  " open ranger when vim open a directory
nnoremap rg :Ranger<CR>

" let g:ranger_explorer_keymap_edit    = 'ro'
" let g:ranger_explorer_keymap_tabedit = 'rt'
" let g:ranger_explorer_keymap_split   = 'rs'
" let g:ranger_explorer_keymap_vsplit  = 'rv'
" 
" nnoremap <silent><Leader>r :RangerOpenCurrentDir<CR>
" nnoremap <silent><Leader>rp :RangerOpenProjectRootDir<CR>


"" LeaderF
let g:Lf_UseCache = 0
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '__pycache__', '.DS_Store'],
    \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    \ '*.gif', '*.db', '*.tgz', '*.tar.gz', '*.gz', '*.zip', '*.bin', '*.pptx',
    \ '*.xlsx', '*.docx', '*.pdf', '*.tmp', '*.wmv', '*.mkv', '*.mp4',
    \ '*.rmvb']
    \}

nnoremap <silent> <leader>f :Leaderf file --popup<CR>


"" tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>to :TagbarOpen<CR>


"" vim-auto-save
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']
let g:auto_save_silent = 0


"" vim-signify
let g:signify_vcs_list = [ 'git' ]


"" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_highlighting_cache = 1


"" asyncrun
let g:asyncrun_open = 20


"" gruvbox8
colorscheme gruvbox8_hard


"" custom
nnoremap <silent> <F10> :AsyncRun python -u "%"<CR>
