"" General
colorscheme one

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set macligatures
    set guifont=Fira\ Code:h16
    set transparency=4
  endif
else
  let g:CSApprox_loaded = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif

set number	"" Show line numbers
set linebreak	"" Break lines at word (requires Wrap lines)
set showbreak=+++	"" Wrap-broken line prefix
set textwidth=0	"" Line wrap (number of cols)
set showmatch	"" Highlight matching brace
set errorbells	"" Beep or flash screen on errors
set visualbell	"" Use visual bell (no beeping)

set dir=~/.vimswap//,/var/tmp//,/tmp//,.    "" Move swapfiles. No more yucky .swps
set hlsearch	"" Highlight all search results
set smartcase	"" Enable smart-case search
set ignorecase	"" Always case-insensitive
set incsearch	"" Searches for strings incrementally

set shiftwidth=2	"" Number of auto-indent spaces
set softtabstop=2	"" Number of spaces per Tab

set smartindent	"" Enable smart-indent
set smarttab
set expandtab "" Enable expandtab

"" Advanced
set autochdir	"" Change working directory to open buffer

set undolevels=1000	"" Number of undo levels

set wildmode=longest,list,full	"" Bash-like tabbing for files
set wildmenu

""Vim Wiki
set nocompatible
filetype plugin on
syntax on

"" Map leader to ,
let mapleader=','

" The Silver Searcher
" from https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" from https://robots.thoughtbot.com/faster-grepping-in-vim
nnoremap K :grep! --word-regexp "<C-R><C-W>"<CR>:cw<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Shortcut to rapidly toggle `set list` --from vimcasts episode 1
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬ "" Use the same symbols as TextMate for tabstops and EOLs

"" vsplit previews in netrw
let g:netrw_preview=1


let g:session_autoload='no'
let g:session_autosave='yes'
let g:session_directory='~/.vim/session'

let g:ConqueTerm_CloseOnEnd=1

" Detect ExpressionEngine syntax from HTML
au BufNewFile,BufRead *.html  call s:EEhtml()

fun! s:EEhtml()
  let n = 1
  while n < 50 && n < line("$")
    if getline(n) =~ '{exp:'
      set syntax=ee
      return
    endif
    let n = n + 1
  endwhile
endfun

"" Pathogen - might come back to this
"" execute pathogen#infect()

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
Plug 'brookhong/DBGPavim'
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-sleuth'
Plug 'valloric/MatchTagAlways'
Plug 'datanoise/vim-crystal'
Plug 'tpope/vim-unimpaired'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim'
Plug 'slashmili/alchemist.vim'
Plug 'lrvick/Conque-Shell'
call plug#end()
