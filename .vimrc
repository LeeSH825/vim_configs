call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive' 			"use git things in vim
Plug 'tpope/vim-sensible' 			"required
Plug 'preservim/nerdtree'			"filetree
Plug 'vim-syntastic/syntastic'		"auto grammar check
Plug 'preservim/nerdcommenter'		"comment
Plug 'nathanaelkane/vim-indent-guides'	"
Plug 'vim-airline/vim-airline'		"fancy status bar
Plug 'airblade/vim-gitgutter'			"see code changes
Plug 'nanotech/jellybeans.vim'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-smooth-scroll'
Plug 'zxqfl/tabnine-vim'
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

color jellybeans

"for syntastic tool
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"for indent guide
let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on " Put your non-Plugin stuff after this line
