#!/bin/bash

function update_configs(){
	git pull 
}

function update_plugins(){
	vim -c "PlugUpdate" -c "PlugUpgrade" 2>/dev/null
	vim -c "q"
}

#Script starts from here
update_configs
update_plugins
echo `echo $SHELL | find -exec cmd {}\`
echo "Do you want to set alias update_vim=bash update.sh ?[y/n]"
read res
case "$res" in
	[yY])
	shopt -s expand_aliases
	echo alias cc=\'bash \.\/update\.sh\' >> ~/.zshrc
	;;
	[nN])
	;;
	*)
	echo "wrong command"
	;;
esac