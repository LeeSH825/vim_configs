#!/bin/bash

# collect system info
dir_name=`dirname $0`
CUR_PATH="`pwd`${dir_name:1}"
SHELLTYPE=`echo $SHELL | cut -d'/' -f3`

function update_configs(){
	cd ${CUR_PATH}
	git pull 
	echo "What setting you want to update?"
	echo "[D]efault setting / 42S[E]OUL setting"
	read upd_ans
	case "$upd_ans" in
		[dD])
			cp ./.vimrc_default ~/.vimrc
			;;
		[eE])
			cp ./.vimrc_42seoul ~/.vimrc
			;;
		*)
			echo -e "wrong command!!\n"
			exit 1
			;;
	esac
	echo "color jellybeans" >> ~/.vimrc
}

function update_plugins(){
	vim -c "PlugUpdate" -c "PlugUpgrade" 2>/dev/null
	vim -c "q"
}

#Script starts from here
update_configs
update_plugins
# echo `echo $SHELL | find -exec cmd {}\`
echo "Do you want to set alias update_vim=bash {current_path}/update.sh ?"
echo "([Y]es / [N]o)"
read res
case "$res" in
	[yY])
	shopt -s expand_aliases
	echo alias update_vim=\'bash \${CUR_PATH}\/update\.sh\' >> ~/.${SHELLTYPE}rc
	;;
	[nN])
	;;
	*)
	echo "wrong command"
	;;
esac
