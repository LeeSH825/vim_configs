#!/bin/bash

function install_norm(){
	if [ -n $1 ]; then
		#for Mac OS
		curl -s https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
	else
		#for Linux
		wget -q https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
	fi
}

function install_plugins(){
	isMac=`uname -a | grep -o Mac`
	if [ -n $isMac ]; then
		#for Mac OS
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		curl -s https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	else
		#for Linux
		mkdir -p ~/.vim/autoload
		wget -q https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
		wget -q https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	fi

	vim -c "PlugInstall" -c "q" -c "q"
	echo color jellybeans >> ~/.vimrc

	install_norm $isMac
	export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
	gem install --user --pr norminette

	echo "Do you want to delete useless files?[Y/n]:"
	read del
	case "$del" in
		[yY])
		rm -rf ../vim_configs
		cd ..
		;;
		[nN])
		;;
		*)
		echo "wrong command"
		;;
	esac
}

#Program starts from here
if [ -e ~/.vimrc ]; then
	echo ".vimrc file already exists. Do you want to overwrite?[Y/n]:"
	read over
	case "$over" in
		[yY])
		rm ~/.vimrc
		rm -rf ~/.vim
		install_plugins
		;;
		[nN])
		;;
		*)
		echo "wrong command"
		;;
	esac

	echo "Do you want to set alias gcc -Werror -Wall -Wextra to cc ?[Y/n]:"
	read cc
	case "$cc" in
		[yY])
		shopt -s expand_aliases
		echo alias cc=\'gcc -Wall -Wextra -Werror\' >> ~/.bash_profile
		source ~/.bash_profile
		;;
		[nN])
		;;
		*)
		echo "wrong command"
		;;
	esac
	exit 0
fi
