set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'cvicentiu/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ciaranm/detectindent'
Plugin 'rhysd/vim-clang-format'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vimwiki/vimwiki'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lyuts/vim-rtags'
Plugin 'peterhoeg/vim-qml'

"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


syntax on

set number
set cursorline
set showmatch
set incsearch
set hlsearch
set autoread
"set cc=80
set nowrap

filetype plugin indent on

set history=1000
set undolevels=1000
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o
set title

autocmd FileType make setlocal noexpandtab

set pastetoggle=<F3>
set viminfo='10,\"100,:20,%,n~/.viminfo

set mouse=a

" Vertical 80 char line
set cc=80
set number
set list listchars=tab:‣\ ,trail:·
"set list listchars=tab:»\ ,trail:·

set list
set expandtab
set ts=4
set shiftwidth=4

set autoindent

set termguicolors
"set t_Co=16
set background=dark
let g:solarized_termcolors = 256
"let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
let g:solarized_visibility='low'
let g:solarized_hitrail=1

let g:detectindent_preferred_indent=2
let g:detectindent_preferred_when_mixed=2
let g:detectindent_preferred_expandtab=1
autocmd BufReadPost * :DetectIndent

let g:gruvbox_italic=1
"colorscheme solarized
colorscheme gruvbox

let g:ycm_confirm_extra_conf=0

autocmd BufEnter *.html :syntax sync fromstart


nnoremap <C-\> :YcmCompleter GoTo<CR>
let g:ycm_python_binary_path="python"


let g:airline_extensions = []
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#disabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'gruvbox'


"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#detect_style_file = 1
"let g:clang_format#auto_format = 1
