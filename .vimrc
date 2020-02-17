call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive' 			"use git things in vim
Plug 'tpope/vim-sensible' 			"required
Plug 'preservim/nerdtree'			"filetree
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'		"comment
Plug 'nathanaelkane/vim-indent-guides'	"
Plug 'vim-airline/vim-airline'		"fancy status bar
Plug 'airblade/vim-gitgutter'			"see code changes
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-smooth-scroll'
Plug 'zxqfl/tabnine-vim'
Plug 'tpope/vim-surround'
call plug#end()

set nocompatible
set number
set cindent
set autoindent
set smartindent
set hlsearch
set tabstop=4
set shiftwidth=4
set mouse=a
set cursorline
filetype off

"for syntastic tool
let g:ale_sign_column_always = 1

"for indent guide
let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on " Put your non-Plugin stuff after this line
