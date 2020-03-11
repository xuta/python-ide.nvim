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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set ignorecase smartcase

set encoding=UTF-8
set fileencoding=utf-8
scriptencoding utf-8

set linebreak
set showbreak=↪
set breakindent
set wrap

set foldmethod=indent
set foldnestmax=2
set nofoldenable

set cursorline
set colorcolumn=99
set scrolloff=6

set mouse=a
set clipboard+=unnamed,unnamedplus

" airline shows mode already
set noshowmode

set confirm
set visualbell noerrorbells
set history=1000
set autowrite

set autoread
au CursorHold * checktime
au FocusGained,BufEnter * :checktime

set splitright
set splitbelow
set wildmenu

set hlsearch
set incsearch


""" Mapping

" move to end of line in insert mode
" <C-o> to switch to normal mode for one command
inoremap <C-e> <C-o>$

" close file
nmap <C-w> :q<cr>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" easy split movement
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" move splitted windows
nnoremap wwh <C-w>H
nnoremap wwj <C-w>J

" tmux-style splitting
nnoremap w% :vsplit<CR>
nnoremap w" :split<CR>

" move on buffer
nnoremap bn :bnext<CR>
nnoremap bp :bprev<CR>

" deletes all buffers except those with unwritten changes
nnoremap bc :bufdo! bd<CR>

" tab
nnoremap tt :tabnew<CR>
nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" fold
nnoremap zz za
vnoremap zz zf

" undo by C-z
inoremap <C-z> <C-o>u

" Remove all trailing whitespace by pressing C-s
nnoremap <C-s> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


""" Vim-plug
let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')

call plug#begin(g:PLUGIN_HOME)

" File managers
" bclose is required by ranger.vim
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" True IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" highlighting
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" handy and smart editor
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'matze/vim-move'
Plug 'skywind3000/vim-quickui'

" status line, color and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ryanoasis/vim-devicons'

" UX
Plug 'yuttie/comfortable-motion.vim'

if executable('ctags')
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
endif

Plug 'skywind3000/asyncrun.vim'

call plug#end()


""" Plugins setting


"" Nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>


"" ranger
let g:bclose_no_plugin_maps = 1
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0  " add this line if you use NERDTree
let g:ranger_replace_netrw = 1  " open ranger when vim open a directory
nnoremap <leader>r :Ranger<CR>


"" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_UseCache = 0
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '__pycache__', '.DS_Store'],
    \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    \ '*.gif', '*.db', '*.tgz', '*.tar.gz', '*.gz', '*.zip', '*.bin', '*.pptx',
    \ '*.xlsx', '*.docx', '*.pdf', '*.tmp', '*.wmv', '*.mkv', '*.mp4',
    \ '*.rmvb']
    \}

nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>s :Leaderf rg<CR>


"" tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>


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

"" vim-move
let g:move_map_keys = 0
vmap <C-down> <Plug>MoveBlockDown
vmap <C-up> <Plug>MoveBlockUp
nmap <C-down> <Plug>MoveLineDown
nmap <C-up> <Plug>MoveLineUp

"" asyncrun
let g:asyncrun_open = 20


"" gruvbox8
colorscheme gruvbox8_hard


"" vim-devicons
let g:webdevicons_enable = 1


"" comfortable-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>


"" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Show all diagnostics.
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Manage extensions.
nnoremap <silent> <leader>me  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>mc  :<C-u>CocList commands<cr>

hi CocErrorSign  ctermfg=LightRed
hi CocWarningSign  ctermfg=LightYellow


"" Custom with AsyncRun
nnoremap <silent> <F10> :AsyncRun python -u "%"<CR>

command! -nargs=? Black     :AsyncRun black -S "%" <f-args>
command! -nargs=? Flake8    :AsyncRun flake8 "%" <f-args>
command! -nargs=0 Pytest    :AsyncRun pytest "%"
command! -nargs=? PytestF   :AsyncRun pytest <f-args>
