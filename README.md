# vim_configs 가이드 라인
## 0. 들어가기 전에..
### 0-0. 다운로드&패치 방법
#### **[1-0.](https://github.com/LeeSH825/vim_configs#1-how-to-patch-vim-configuration-file)항목으로 가서 지시 사향을 참고해주세요!**
### 0-1. 목적
#### 이 설정 파일은 **VIM8(특히 MacOS에 깔려있는 기본 VIM)** 을 목표로 작성되었습니다.
##### '42서울'에 참여하는 동안, VIM을 사용할 일이 있을 것입니다. (모든 42교육에 참여하는 학생들도 그럴겁니다.)
##### 42서울의 모든 시스템은 'MacOS' 기반으로 돌아가며, 이는 윈도우 유저들에게 친숙하지 않은 환경입니다.
##### 따라서, 42서울의 참여자들에게 VIM 설정의 표준을 제공하면 편할 것이라고 생각했습니다.
##### 이 설정은 어떠한 슈퍼 유저의 권한도 필요로 하지 않으며, 42 환경에서 잘 작동하는 것이 검증되었습니다.
##### 이제, 42서울에서 VIM을 사용하는 것에 두려워하지 마세요.

### 0-2. 표기
#### 0-2.1. '$'
* 쉘에서의 명령어
#### 0-2.2. ':'
* VIM의 명령모드에서의 명령어
### 0-3. 이전 VIM 설정으로 돌리는 방법
#### <a href="https//raw.githubusercontent.com/LeeSH825/vim_configs/master/restore.sh" download="restore.sh">restore.sh</a>을 다운로드 하고, 터미널에서 실행하세요.
###### (이 과정에서 문제가 생긴다면, $ chmod 755 restore.sh 후에 시도해보세요.)
```bash
$ ./restore.sh
```
#### 아니면, ~/.vimrc, ~/.vim/ 을 삭제하고 이전 설정 파일로 교체하면 됩니다.
#### (auto-script.sh로 설정을 패치한 경우, ~/.vimrc.backup 파일과 ~/.vim_backup/ 폴더가 백업되어 있습니다.)
```bash
$ rm -rf ~/.vimrc ~/.vim
$ mv ~/.vimrc.backup ~/.vimrc
$ mv ~/.vim_backup ~/.vim
```
***
## 1. How to patch VIM configuration file
### 1-0. If you do not want to disturb yourself
#### There is 'auto-script.sh' file. You can do rest of things in simple way.
#### You can just download <a href="https://raw.githubusercontent.com/LeeSH825/vim_configs/master/auto-script.sh" download="auto-script.sh">auto-script.sh</a> and run it at terminal.
###### (If you have some trouble with running it, you can do $ chmod 755 auto-script.sh)
#### or (You would better use this method)
```bash
$ git clone https://github.com/LeeSH825/vim_configs.git
$ ./vim_configs/auto-script.sh
$ source ~/.zshrc
```
##### Then rest of 1-1~7 will be finished. (You must do source ~/.zshrc to use alias in your current Shell!!)

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
$ gem install --user --pre norminette
```
### 1-5. Set color theme
```bash
$ echo color jellybeans >> ~/.vimrc
```
### 1-6. Set alias for convenience
```bash
$ alias cc='gcc -Werror -Wall -Wextra'
$ alias nm='norminette -R -CheckForbiddenSourceHeader'
```
### 1-7. Patch to your current Shell
```bash
$ source ~/.zshrc
```
***
## 2. Plugins
### 2-1. tpope/vim-fugitive
* Enable to use git commands in VIM
* Usage: :Git add , :Git commit
- *More Informations on https://github.com/tpope/vim-fugitive*

### 2-2. tpope/vim-sensible
* Basic options for VIM
- *More Informations on https://github.com/tpope/vim-sensible*

### 2-3. preservim/nerdtree
* File tree explorer
* Usage: :NERDtree
- *More Informations on https://github.com/preservim/nerdtree*

### 2-4. dense-analysis/ale
* Syntax checker (Always running)
- *More Informations on https://github.com/dense-analysis/ale*

#### 2.4-1. Norminette Linter for ALE
* Help you to code within norminette
- *More Informations on https://gist.github.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177*

### 2-5. preservim/nerdcommenter
* Help to comment more easily
- *More Informations on https://github.com/preservim/nerdcommenter*

~~### 2-6 zxqfl/tabnine-im~~
~~* Auto-complete framework~~
~~- *More Informations on https://tabnine.com/semantic*~~

### 2-7. nathanaelkane/vim-indent-guides
* Display indent levels visually
- *More Informations on https://github.com/nathanaelkane/vim-indent-guides*

### 2-8. vim-airline/vim-airline
* More informations on status bar
* Usage: Mode | Git branch | Filename | Filetype | File encoding | Current Position | Warning/Error form PlugIns
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
* Usage: Ctrl + p
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
* Usage: cs'" -> change ' to ", Ctrl+v -> Shift+S+" to wrap with "
- *More Informations on https://github.com/tpope/vim-surround*

### 2-16. pbondoer/vim-42header
* VIM header for 42projects
* Usage: F1 to set 42header
- *More Informations on https://github.com/pbondoer/vim-42header*

### 2-17. easymotion/vim-easymotion
* Easy to move cursor
- *More Informations on https://github.com/easymotion/vim-easymotion*

### 2-18. edkolev/promptline.vim
* Make shell within VIM
* Usage: :PromptlineSnapshot
- *More Informations on https://github.com/edkolev/promptline.vim*

### 2-19. xuhdev/SingleCompile
* Compile within VIM
* Usage: Press F9 to compile, Press F10 to run
- *More informations on https://github.com/xuhdev/SingleCompile*

### 2-20. pangloss/vim-simplefold
* Fold codes easily
- *More Informations on https://github.com/pangloss/vim-simplefold*

### 2-21. vim-scripts/WhiteWash
* Removes white spaces
* Press ^M to remove all white spaces
- *More Informations on https://github.com/vim-scripts/WhiteWash*
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

### 3-12. nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>
* remove all trailing whitespace by pressing F5
***
## 4. Customization
* If you are willing to customize this .vimrc file, you have to refer bash style coding guide
* You might refer guide from here : <https://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf>
* Don't forget ':PlugClean' whenever you have changes in Plugins
***
## 5. Feedback
* You can contact me with fleming@kakao.com
