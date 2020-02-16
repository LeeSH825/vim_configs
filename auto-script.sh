#!/bin/sh
STR1 = `uname -a | grep Mac`

if [$STR1 -n ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
else 
	mkdir -p ~/.vim/autoload
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
	wget https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
fi
vim -c "PluginInstall" -c "q" -c "q"
rm -rf ../vim_configs
