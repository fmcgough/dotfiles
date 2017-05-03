" Load pathogen

execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Display line numbers on the left
set number
set t_Co=256
if exists('$TMUX')
	set term=screen-256color
else
	set term=xterm-256color
endif

set background=light
colorscheme PaperColor

set laststatus=2

" Reduce delay when hitting Esc to enter normal mode
set timeoutlen=1000 ttimeoutlen=10

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'pencil'

let g:airline#extensions#hunks#enabled = 0

hi LineNr ctermbg=253
hi SignColumn ctermbg=253

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <silent> <C-@> :FZF<CR>

set colorcolumn=120

set tabstop=2 " spaces per tab
set softtabstop=2 " spaces per tab when inserting/deleting text
set expandtab " tabs are spaces, no tabs here ever

set showcmd " show commands under statusline
set cursorline " highlight line with the cursor
set wildmenu " visual autocomplete for command menu



