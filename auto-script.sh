#!/bin/bash

# collect system information
OSTYPE=`uname`
SHELLTYPE=`echo $SHELL | cut -d'/' -f3`
Seoul=0
is_alias=0

function customize_plugins(){
    echo "In construction"
}

function use_preset(){
    cp ./.vimrc_$1 ~/.vimrc
}

# installing plugin
function install_plugins(){
    if [ -e ~/.vim/autoload/plug.vim ]; then
        rm -rf ~/.vim/autoload/
    fi
    if [ $OSTYPE == 'Linux' ]; then
        DOWNLOAD_UTIL='wget'
        mkdir -p ~/.vim/autoload
        #
		#wget -q https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
        #ls -la ~/.vim/autoload
        #
        wget -q https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
        mv ./plug.vim ~/.vim/autoload/plug.vim
    else
        DOWNLOAD_UTIL='curl'
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    vim -c "PlugInstall" -c "q" -c "q" 2>/dev/null
    echo "color jellybeans" >> ~/.vimrc
}

function install_norm(){
    isRuby=`gem --version`
    if [ -z $isRuby ]; then
        echo "Ruby is not installed!"
        # echo "Do you want to install Ruby?"
        # echo "([Y]es / [N]o)"
    fi
    if [ -d `ruby -e 'puts Gem.user_dir'`/gems/norminette-1.0.0.rc2.pre.2 ]; then
			:
    else
    #norminette not installed
        if [ $OSTYPE == 'Linux' ]; then
            wget -q https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
        else
            curl -s https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
        fi
        export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
        gem install --user --pre norminette
    fi
}

# install_process
function install_process(){
    echo "Do you want to customize your .vimrc setting?"
    echo "([C]ustomize setting / use [D]efault setting / use 42S[E]OUL setting)"
    read cm_ans
    case "$cm_ans" in
        [cC])
            customize_plugins
            is_error=0
            ;;
        [dD])
            use_preset default
            is_error=0
            ;;
        [eE])
            use_preset 42seoul
            Seoul=1
            is_error=0
            ;;
        *)
            echo -e "wrong command!!\n"
            is_error=1
            install_process
            ;;
    esac
    if [ $is_error -eq 0 ]; then
        install_plugins
        if [ $Seoul -eq 1 ]; then
            install_norm
        fi
    fi
}

function set_alias(){
    # for full optioned gcc
    if [ $1 -le 0 ]; then
        echo "Do you want to set alias cc=gcc -Werror -Wall -Wextra ?"
        echo "([Y]es / [N]o)"
        read alias_res1
        case "$alias_res1" in
            [yY])
            shopt -s expand_aliases
            echo alias cc=\'gcc -Wall -Wextra -Werror\' >> ~/.$SHELLTYPErc
            is_alias=1
            ;;
            [nN])
            ;;
            *)
            echo -e "wrong command!!\n"
            is_error=1
            set_alias 0
            ;;
        esac
    fi
    # norminette for 42Seoul
    if [ $1 -le 1 ]; then
        if [ $Seoul -eq 1 ]; then
            echo "Do you want to set alias nm=norminette -R CheckForbiddenSourceHeader ?"
            echo "([Y]es / [N]o)"
            read alias_res2
            case "$alias_res2" in
                [yY])
                shopt -s expand_aliases
                echo alias cc=\'norminette -R CheckForbiddenSourceHeader\' >> ~/.$SHELLTYPErc
                is_alias=1
                ;;
                [nN])
                ;;
                *)
                echo -e "wrong command!!\n"
                set_alias 1
                ;;
            esac
        fi
    fi

    if [ $is_alias -eq 1 ]; then
        echo You must type \"source ./$SHELLTYPErc\" to use those aliases in current shell.\(just for one time.\)
        echo You can see your aliases by typing \"alias\"
    fi
}

function del_files(){
    echo "Do you want to delete useless files?(these script files)"
    echo "([Y]es / [N]o)"
    read del_res
    case "$del_res" in
	    [yY])
	    rm -rf ../vim_configs
	    ;;
        [nN])
        ;;
        *)
        echo -e "wrong command!!\n"
        del_files
        ;;
    esac
}

# if original vimrc exists -> make backup
if [ -e ~/.vimrc ]; then
    echo ".vimrc file already exists."
    echo "Do you want to process anyway?"
    echo "(process [A]nyway / make [B]ackup / [C]ancel the process)"
    read pr_ans
    case "$pr_ans" in
        [aA])
            install_process
            is_error=0
            ;;
        [bB])
            mv ~/.vimrc ~/.vimrc_backup
            mv ~/.vim ~/.vim_backup
            echo "Created backup files: ~/.vimrc -> ~/.vimrc_backup"
            echo "                      ~/.vim   -> ~/.vim_backup"
            install_process
            is_error=0
            ;;
        [cC])
            exit 0
            ;;
        *)
            echo -e "wrong command!!\n"
            is_error=1
            $0
            exit 0
            ;;
    esac
else
    install_process
fi
if [ $is_error -eq 0 ]; then
    set_alias 0
    del_files
fi
