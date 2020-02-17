call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive' 				"use git things in vim
Plug 'tpope/vim-sensible' 				"required
Plug 'preservim/nerdtree'				"filetree
Plug 'dense-analysis/ale'				"syntax check
Plug 'preservim/nerdcommenter'			"comment
Plug 'nathanaelkane/vim-indent-guides'	"auto-indent
Plug 'vim-airline/vim-airline'			"fancy status bar
Plug 'airblade/vim-gitgutter'			"see code changes
Plug 'nanotech/jellybeans.vim'			"color theme
"Plug 'junegunn/fzf.vim'				"file manager
Plug 'ctrlpvim/ctrlp.vim'				"file manager
Plug 'terryma/vim-multiple-cursors'		"multiple selection
Plug 'Raimondi/delimitMate'				"auto bracket
Plug 'terryma/vim-smooth-scroll'		"smooth scroll
Plug 'zxqfl/tabnine-vim'				"auto complete
Plug 'tpope/vim-surround'				"smart quotes
Plug 'pbondoer/vim-42header'				"42header
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

"for nerd-tree
"autocmd vimenter * NERDTree 		"automatically start
"map <C-d> :NERDTreeToggle<CR>		"open NERDTree with ctrl+d

"for nerd-commenter
let g:NERDSpaceDelims = 1				" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1			" Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1			" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1	" Enable trimming of trailing whitespace when uncommenting

"for syntastic tool
let g:ale_sign_column_always = 1

"for vim-indent-guide
let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on " Put your non-Plugin stuff after this line
