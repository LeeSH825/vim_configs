set nocompatible
set number
set cindent
set autoindent
set smartindent
set hlsearch
set tabstop=4
set shiftwidth=4
set mouse-=a
set cursorline
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' 			"required
Plugin 'tpope/vim-fugitive' 			"use git things in vim
Plugin 'tpope/vim-sensible' 			"required
Plugin 'preservim/nerdtree'			"filetree
Plugin 'vim-syntastic/syntastic'		"auto grammar check
Plugin 'preservim/nerdcommenter'		"comment
Plugin 'Shougo/neocomplcache.vim'	
Plugin 'nathanaelkane/vim-indent-guides'	"
Plugin 'vim-airline/vim-airline'		"fancy status bar
Plugin 'airblade/vim-gitgutter'			"see code changes
Plugin 'nanotech/jellybeans.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'AutoComplPop'
"Plugin 'taglist-plus'
call vundle#end()

color jellybeans

"for syntastic tool
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"for indent guide
let g:indent_guides_enable_on_vim_startup = 1

"for auto-complete
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

filetype plugin indent on " Put your non-Plugin stuff after this line
