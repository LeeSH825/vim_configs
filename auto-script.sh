#!/bin/bash

function install_norm(){
	if [ $1 -n ]; then
		#for Mac OS
		curl https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
	else
		#for Linux
		wget https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
	fi
}

function install_plugins(){
	isMac = `uname -a | grep Mac`
	if [ $isMac -n ]; then
		#for Mac OS
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		curl https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	else
		#for Linux
		mkdir -p ~/.vim/autoload
		wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
		wget https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	fi

	vim -c "PlugInstall" -c "q" -c "q"
	echo color jellybeans >> ~/.vimrc

	install_norm $isMac
	export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
	gem install --user --pr norminette

	rm -rf ../vim_configs
	cd ..
}

#Program starts from here
if [ -e ~/.vimrc ]; then
	echo ".vimrc file already exists. Do you want to overwrite?[Y/n]:"
	read char
	case "$char" in
		[yY])
		install_plugins
		;;
		[nN])
		exit 1
		;;
		*)
		exit 1
		;;
	esac
fi
install_plugins
