""" vim-plug
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
Plug 'xuta/vim-xspace'

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
Plug 'easymotion/vim-easymotion'

" status line, color and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-markdown'

" UX
Plug 'yuttie/comfortable-motion.vim'

if executable('ctags')
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
endif

" more weapon
Plug 'skywind3000/asyncrun.vim'

call plug#end()


""" setting


"" ranger
let g:bclose_no_plugin_maps = 1
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1


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


"" vim-auto-save
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']
let g:auto_save_silent = 0


"" vim-fugitive
set diffopt+=vertical


"" vim-signify
let g:signify_vcs_list = [ 'git' ]


"" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_highlighting_cache = 1


"" vim-move
let g:move_map_keys = 0


"" asyncrun
let g:asyncrun_open = 20


"" ayu
let g:airline_theme='ayu_mirage'
let ayucolor="mirage"
colorscheme ayu


"" vim-xspace
let g:xspace_session_name = '.Session.vim'


"" vim-devicons
let g:webdevicons_enable = 1


"" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql', 'vim']
let g:markdown_syntax_conceal = 0


"" comfortable-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1


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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

hi CocErrorSign  ctermfg=LightRed
hi CocWarningSign  ctermfg=LightYellow
