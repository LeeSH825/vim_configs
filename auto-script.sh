#!/bin/sh
STR0 = `ls ~/.vimrc`
if [$STR0 -n]; then
	if (whiptail --title "Caution" --yesno "There is .vimrc file already. Do you want to Change?." 8 78); then
		STR1 = `uname -a | grep Mac`
		if [$STR1 -n ]; then
			curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			curl https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
		else 
			mkdir -p ~/.vim/autoload
			wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
			wget https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
		fi
		vim -c "PlugInstall" -c "q" -c "q"
		echo color jellybeans >> ~/.vimrc
		rm -rf ../vim_configs
	else
		exit 0
	fi
else
	STR1 = `uname -a | grep Mac`
	if [$STR1 -n ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		curl https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
	else 
		mkdir -p ~/.vim/autoload
		wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
		wget https://raw.githubusercontent.com/LeeSH825/vim-_configs/master/.vimrc -o ~/.vimrc
	fi
	vim -c "PlugInstall" -c "q" -c "q"
	echo color jellybeans >> ~/.vimrc
	rm -rf ../vim_configs
fi
