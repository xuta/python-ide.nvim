""" Mapping
" go to end of line of insert mode by Ctrl-]
inoremap <C-]> <C-o>$
nnoremap <C-]> i<C-o>$

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" easy split movement
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

" (Shift) Tab to change windows
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
command! -nargs=0 BufferClear    :bufdo! bd

" tab
nnoremap tt :tabnew<CR>
nnoremap tr :tabnew<CR>:Ranger<CR>
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>

" fast movement
nnoremap <C-j> 2j
nnoremap <C-k> 2k
vnoremap <C-j> 2j
vnoremap <C-k> 2k

" fold/unfold by zz because za is not handy
nnoremap zz za

" undo by Ctrl-z
inoremap <C-z> <C-o>u

" select all by Ctr-a in normal mode
nnoremap <C-a> <esc>ggVG<CR>

" close file by Ctrl-w
nnoremap <C-w> :q<CR>

" clear search highlight by Ctr-l
nnoremap <silent> <C-l> :nohl<CR>

" Remove all trailing whitespace by pressing Ctrl-s
nnoremap <C-s> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" close current file by Ctrl-w
nnoremap <C-w> :q<CR>

" pycharm keys binding: tab to indent multiple lines in visual mode
vnoremap <tab> >
vnoremap <S-tab> <

" exit termimal mode
tnoremap <Esc> <C-\><C-n>

"" custom commands with AsyncRun
nnoremap <silent> <F10> :AsyncRun python -u "%"<CR>

command! -nargs=? Black     :AsyncRun black -S "%" <f-args>
command! -nargs=? Flake8    :AsyncRun flake8 "%" <f-args>
command! -nargs=0 Pytest    :AsyncRun pytest "%"
command! -nargs=? PytestF   :AsyncRun pytest <f-args>


"" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>


"" ranger
nnoremap <leader>r :Ranger<CR>


"" LeaderF
nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>s :Leaderf rg<CR>


"" tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>


"" vim-easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


"" vim-move
let g:move_map_keys = 0
vmap <C-down> <Plug>MoveBlockDown
vmap <C-up> <Plug>MoveBlockUp
nmap <C-down> <Plug>MoveLineDown
nmap <C-up> <Plug>MoveLineUp


"" comfortable-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1

" Ctrl-d to scroll down
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
" Ctrl-u to scroll up
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>

" Scroll by mouse
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>


"" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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
