#!/bin/bash

function install_norm(){
	isRuby=`gem --version`
	if [ -z $isRuby ]; then
		#Ruby not installed
		echo "Ruby is not installed in your system"
	else
		if [ -d `ruby -e 'puts Gem.user_dir'`/gems/norminette-1.0.0.rc2.pre.2 ]; then
			:
		else
			#norminette not installed
			if [ -n $1 ]; then
				#for Mac OS
				curl -s https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
			else
				#for Linux
				wget -q https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
			fi
			export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
			gem install --user --pr norminette
		fi
	fi
}

function install_plugins(){
	if [ -n $1 ]; then
		#for Mac OS
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		curl -s https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	else
		#for Linux
		mkdir -p ~/.vim/autoload
		wget -q https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
		wget -q https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
	fi

	vim -c "PlugInstall" -c "q" -c "q" 2>/dev/null
	echo color jellybeans >> ~/.vimrc
}

#Program starts from here
isMac=`uname -a | grep -o Mac`
if [ -e ~/.vimrc ]; then
	echo ".vimrc file already exists. Do you want to overwrite?[y/n]:"
	read over
	case "$over" in
		[yY])
		mv ~/.vimrc ~/.vimrc.backup
		mv ~/.vim ~/.vim_backup
		echo "Created backup files."
		install_plugins $isMac
		;;
		[nN])
		;;
		*)
		echo "wrong command"
		;;
	esac
else
	echo "Installing .vimrc"
	install_plugins $isMac
fi

install_norm $isMac
grep gcc ~/.bash_profile
echo "Do you want to set alias cc= gcc -Werror -Wall -Wextra ?[y/n]:"
read ali
case "$ali" in
	[yY])
	shopt -s expand_aliases
	echo alias cc=\'gcc -Wall -Wextra -Werror\' >> ~/.bash_profile
	;;
	[nN])
	;;
	*)
	echo "wrong command"
	;;
esac

echo "Do you want to delete useless files?[y/n]:"
read del
case "$del" in
	[yY])
	rm -rf ../vim_configs
	;;
	[nN])
	;;
	*)
	echo "wrong command"
	;;
esac
exit 0
