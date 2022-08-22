set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe' "Requires configuration
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'christoomey/vim-system-copy'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'taketwo/vim-ros'
Plugin 'dense-analysis/ale'
" Plugin 'davidhalter/jedi-vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"more characters will be sent to the screen for redrawing

"""""""""
" Cursor "
""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set mouse=a
"""""""""""""
" Clipboard "
"""""""""""""
set clipboard=unnamedplus

set ttyfast
"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50
"make backspace behave properly in insert mode
set backspace=indent,eol,start
"display incomplete commands
set showcmd
"a better menu in command mode
set wildmenu
set wildmode=longest:full,full
"hide buffers instead of closing them even if they contain unwritten changes
set hidden
"disable soft wrap for lines
set nowrap
"always display the status line
set laststatus=2
"display line numbers on the left side
set number
"highlight current line
set cursorline
"display text width column
set colorcolumn=81
"new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright
"always set autoindenting on
set autoindent
"incremental search
set incsearch
"highlight search
set hlsearch
"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase
"other settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set noswapfile

"SYNTASTIC
let g:syntastic_python_checkers = ['flake8']

"COLORSCHEME
" set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight
colorscheme gruvbox
set bg=dark
 
"KEYMAPPINGS
let mapleader = " "
inoremap jk <Esc>
inoremap kj <Esc>
noremap <Leader><Tab> :bn<CR>
noremap <Leader><S-Tab> :bp<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt


" CODE FOLDING
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"LANGUAGE NATIVE
" PYTHON
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
" let python_highlight_all=1
syntax on
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }


" YCM settings
let g:ycm_max_num_candidates = 5
let g:ycm_warning_symbol = '>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_max_diagnostics_to_display = 0  " Reference: https://github.com/ycm-core/YouCompleteMe/issues/2392
" YCM Error & Warning Color Scheme https://jonasjacek.github.io/colors/
hi YcmErrorSection ctermbg=0 cterm=underline
hi YcmWarningSection ctermbg=0 cterm=underline
" Python
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=1
let g:ycm_python_binary_path='/usr/bin/python3'
" C++
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")"
let g:ycm_clangd_args = ['-log=verbose', '-pretty']

" YCM Shortcut 
" Go to definition
" map g :YcmCompleter GoTo<CR>  

let g:airline#extensions#tabline#enabled = 1

" ALE settings
let g:airline#extensions#ale#enabled = 1


