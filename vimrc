"" General
colorscheme one

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set macligatures
    set guifont=Fira\ Code:h15
    set transparency=2
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
set textwidth=100	"" Line wrap (number of cols)
set showmatch	"" Highlight matching brace
set errorbells	"" Beep or flash screen on errors
set visualbell	"" Use visual bell (no beeping)

set hlsearch	"" Highlight all search results
set smartcase	"" Enable smart-case search
set ignorecase	"" Always case-insensitive
set incsearch	"" Searches for strings incrementally

set shiftwidth=4	"" Number of auto-indent spaces
set smartindent	"" Enable smart-indent
set softtabstop=4	"" Number of spaces per Tab

"" Advanced
set autochdir	"" Change working directory to open buffer

set undolevels=1000	"" Number of undo levels

set wildmode=longest,list,full	"" Bash-like tabbing for files
set wildmenu

"" Map leader to ,
let mapleader=','

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

"" Pathogen
execute pathogen#infect()
