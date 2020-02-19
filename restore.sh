#!/bin/bash

echo "Do you want to restore VIM to previous state?[Y/n]:"
read re
case "$re" in
	[yY])
	rm ~/.vimrc
	rm -rf ~/.vim
	if [ -e ~/.vimrc.backup ]; then
		mv ~/.vimrc.backup ~/.vimrc
	fi
	if [ -d ~/.vim_backup ]; then
		mv -r ~/.vim_backup ~/.vim
	fi
	exit 0
	;;
	[nN])
	exit 0
	;;
	*)
	echo "wrong command"
	exit 1
	;;
esac
