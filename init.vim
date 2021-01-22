call plug#begin('~/.vim/plugged')

" Google Formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Theme and Icons
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'

" nerdtree (folder directory)
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" fzf (fuzzy find files)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Show git history
Plug 'airblade/vim-gitgutter'

" Switch between windows
Plug 'christoomey/vim-tmux-navigator'

" Web Programming (uncomment if need)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
call plug#end()

" Web Programming Formatter (uncomment if need)
command! -nargs=0 Format :call CocAction('format')

" Google Autoformatting
augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType java AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula

syntax on

set nocompatible
set hidden
set number
set relativenumber
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set laststatus=2

" Indentation and Tab
set cindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab " 1 tab = 2 spaces

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit.
nmap <Left>  :echoe "Use h"<CR>
nmap <Right> :echoe "Use l"<CR>
nmap <Up>    :echoe "Use k"<CR>
nmap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
imap <Left>  <ESC>:echoe "Use h"<CR>
imap <Right> <ESC>:echoe "Use l"<CR>
imap <Up>    <ESC>:echoe "Use k"<CR>
imap <Down>  <ESC>:echoe "Use j"<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <silent> <C-b> :NERDTreeToggle<CR>

" Turn terminal to normal mode with escape
tmap <Esc> <C-\><C-n>

" Open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nmap <C-n> :call OpenTerminal()<CR>

set splitright
set splitbelow

" Move lines like a pro (option + J/K)
nmap ∆ :m .+1<CR>==
nmap ˚ :m .-2<CR>==

imap ∆ <Esc>:m .+1<CR>==gi
imap ˚ <Esc>:m .-2<CR>==gi

vmap ∆ :m '>+1<CR>gv=gv
vmap ˚ :m '<-2<CR>gv=gv

" fzf
nnoremap fzf :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" IntelliSense and Syntax Highlighting
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Quick comment (set iTerm preference as well)
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Must have (ESC is too far!)
inoremap jk <ESC>

" Format
"let g:clang_format#auto_format=1
vmap FF :FormatCode
nmap FF :FormatCode
