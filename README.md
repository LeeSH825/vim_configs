# vim_configs Guideline
## 0. Preface 
### 0-1. Purpose
#### This configuration file is for **VIM8(especially for pre-installed VIM at Mac OS)**
###### There are some needs of using VIM while participating '42Seoul'.
###### Since all systems in 42Seoul are in environment of 'Mac OS', some kind of standard should be established.
###### I don't know which thing I can do at 42Seoul, but using VIM as IDE must be helpful.
###### By this time, I would like to set standards for VIM.
### 0-2. Notations
#### 0-2.1. '$'
* commands at the bash shell
#### 0-2.2. ':'
* commands at the VIM shell
### 0-3. How to return to normal VIM
##### You can get normal VIM by removing .vimrc, ~/.vim
```bash
$ rm -rf .vimrc ~/.vim
```
***
## 1. How to patch .vimrc
### 1-0. If you don't want to disturb yourself
#### There is 'auto-script.sh' file. You can do rest of things in simple way.
#### You can just download <a href="https://raw.githubusercontent.com/LeeSH825/vim_configs/master/auto-script.sh" download="auto-script.sh">auto-script.sh</a> and run it at terminal.
###### (If you have some trouble with running it, you can do $ chmod 755 auto-script.sh)
#### or (You would better use this method)
```bash
$ git clone https://github.com/LeeSH825/vim_configs.git
$ ./vim_configs/auto-script.sh
$ source ~/.bash_profile
```
##### Then rest of 1-1~3 will finish.

### 1-1. Install vim-plug
For Mac OS
```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
For Linux
```bash
$ mkdir -p ~/.vim/autoload
$ wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
```
### 1-2. Download .vimrc file
For Mac OS
```bash
$ curl https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
```
For Linux
```bash
$ wget https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
```
### 1-3. Install Plugins
```bash
$ vim -c "PlugInstall" -c "q" -c "q"
```
or you can just use 
```
$ vim
:PlugInstall
:q!
:q!
```
### 1-4. Install Norminette for ALE
#### 1-4.1. Download Norminette.vim
For Mac OS
```bash
$ curl https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
```
For Linux
```bash
$ wget https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
```
#### 1-4.2. Install Norminette
```bash
$ export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
$ gem install --user --pr norminette
```
### 1-5. Set color theme
```bash
$ echo color jellybeans >> ~/.vimrc
```
### 1-6. Set alias for convenience
```bash
$ alias cc='gcc -Werror -Wall -Wextra'
```
***
## 2. Plugins
### 2-1. tpope/vim-fugitive
* Enable to use git commands in VIM
- *More Informations on https://github.com/tpope/vim-fugitive*

### 2-2. tpope/vim-sensible
* Basic options for VIM
- *More Informations on https://github.com/tpope/vim-sensible*

### 2-3. preservim/nerdtree
* File tree explorer
- *More Informations on https://github.com/preservim/nerdtree*

### 2-4. dense-analysis/ale
* Syntax checker
- *More Informations on https://github.com/dense-analysis/ale*

#### 2.4-1. Norminette Linter for ALE
* Help you to code within norminette
- *More Informations on https://gist.github.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177*

### 2-5. preservim/nerdcommenter
* Help to comment more easily
- *More Informations on https://github.com/preservim/nerdcommenter*

### 2-6 zxqfl/tabnine-im
* Auto-complete framework
- *More Informations on https://tabnine.com/semantic*

### 2-7. nathanaelkane/vim-indent-guides
* Display indent levels visually
- *More Informations on https://github.com/nathanaelkane/vim-indent-guides*

### 2-8. vim-airline/vim-airline
* More informations on status bar
- *More Informations on https://github.com/vim-airline/vim-airline*

### 2-9. airblade/vim-gitgutter
* Indicate changed lines for GIT things
- *More Informations on https://github.com/airblade/vim-gitgutter*

### 2-10. nanotech/jellybeans.vim
* Color theme "jellybeans"
- *More Informations on https://github.com/nanotech/jellybeans.vim*

### 2-11. ctrlpvim/ctrlp.vim
* Help to open files more easily, and more quickly
* (Changed from fzf to ctrlp for integration problem with vim-airline)
- *More Informations on https://github.com/ctrlpvim/ctrlp.vim*

### 2-12. terryma/vim-multiple-cursors
* Enable to select multiple things
- *More Informations on https://github.com/terryma/vim-multiple-cursors*

### 2-13. Raimondi/delimitMate
* Auto-completion for quotes, parens, brackets, etc
- *More Informations on https://github.com/Raimondi/delimitMate*

### 2-14. terryma/vim-smooth-scroll
* Make scrolling in VIM more pleasant
- *More Informations on https://github.com/terryma/vim-smooth-scroll*

### 2-15. tpope/vim-surround
* Manage brackets or quotes more easily
- *More Informations on https://github.com/tpope/vim-surround*

### 2-16. pbondoer/vim-42header
* VIM header for 42projects
- *More Informations on https://github.com/pbondoer/vim-42header*
***
## 3. VIM local settings
### 3-1. set nocompatible
* enable to move cursors with arrow keys

### 3-2. set number
* indicate the line number

### 3-3. set cindent
* indenting with c-style

### 3-4. set autoindent
* auto indenting

### 3-5. set smartindent
* smart indenting

### 3-6. set hlsearch
* highlight on search results	

### 3-7. set tabstop=4
* set tab key to "4" space

### 3-8. set shiftwidth=4
* set shift key to "4" space

### 3-9. set mouse=a
* enable using mouse

### 3-10. set cursorline
* highlight on current working line

### 3-11. color jellybeans
* set color theme to "jellybeans"
***
## 4. Customization
* If you are willing to customize this .vimrc file, you have to refer bash style coding guide
* You might refer guide from here : <https://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf>
* Don't forget ':PlugClean' whenever you have changes in Plugins
***
## 5. Feedback
* You can contact me with fleming@kakao.com
