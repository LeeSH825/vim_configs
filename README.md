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
### 0-4. 플러그인 업데이트
```bash
:PlugUpdate
:PlugUpgrade
```
***
## 1. VIM 설정 파일 패치하기
### 1-0. 간편한 방법
#### 'auto-script.sh'파일을 이용하면, 모든 작업들을 한번에 할 수 있습니다.
#### <a href="https://raw.githubusercontent.com/LeeSH825/vim_configs/master/auto-script.sh" download="auto-script.sh">auto-script.sh</a>를 다운받아서 터미널에서 실행하세요.
###### (실행하는데 문제가 있다면 $ chmod 755 auto-script.sh 후에 실행해보세요.)
```bash
$ git clone https://github.com/LeeSH825/vim_configs.git
$ ./vim_configs/auto-script.sh
$ source ~/.zshrc
```
##### 그러면 이제 1-1~7의 과정들이 끝납니다. ($ source ~/.zshrc 를 해줘야 현재 쉘에서 alias들을 사용할 수 있습니다.)

### 1-1. vim-plug 설치하기
For Mac OS
```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
For Linux
```bash
$ mkdir -p ~/.vim/autoload
$ wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim
```
### 1-2. .vimrc 파일 다운로드
For Mac OS
```bash
$ curl https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
```
For Linux
```bash
$ wget https://raw.githubusercontent.com/LeeSH825/vim_configs/master/.vimrc -o ~/.vimrc
```
### 1-3. 플러그인 설치
```bash
$ vim -c "PlugInstall" -c "q" -c "q"
```
혹은
```
$ vim
:PlugInstall
:q!
:q!
```
### 1-4. ALE용 Norminette 설치
#### 1-4.1. Norminette.vim 다운로드
For Mac OS
```bash
$ curl https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
```
For Linux
```bash
$ wget https://gist.githubusercontent.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177/raw/2849086f56cea73c60283496e9386a5bef0ff636/norminette.vim -o ~/.vim/plugged/ale/ale_linters/c/norminette.vim
```
#### 1-4.2. Norminette 설치
```bash
$ export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
$ gem install --user --pre norminette
```
### 1-5. 컬러 테마 적용
```bash
$ echo color jellybeans >> ~/.vimrc
```
### 1-6. 편의를 위한 단축어 설정
```bash
$ alias cc='gcc -Werror -Wall -Wextra'
$ alias nm='norminette -R -CheckForbiddenSourceHeader'
```
### 1-7. 현재 쉘에 적용
```bash
$ source ~/.zshrc
```
***
## 2. 설정에서 사용한 플러그인들
### 2-1. tpope/vim-fugitive
* VIM 안에서 git 명령어들을 사용할 수 있게 함
* 대표 사용법: :Git add, :Git commit
- *더 많은 정보는 https://github.com/tpope/vim-fugitive*

### 2-2. tpope/vim-sensible
* VIM에서 사용되는 기본 옵션
- *More Informations on https://github.com/tpope/vim-sensible*

### 2-3. preservim/nerdtree
* 파일 탐색기
* 대표 사용법: :NERDtree
- *더 많은 정보는 https://github.com/preservim/nerdtree*

### 2-4. dense-analysis/ale
* 문법 검사기 (항상 실행되고 있음)
- *더 많은 정보는 https://github.com/dense-analysis/ale*

#### 2.4-1. Norminette Linter for ALE
* ALE에서 Norminette를 참고하여 검사하게 함
- *더 많은 정보는 https://gist.github.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177*

### 2-5. preservim/nerdcommenter
* 주석을 더 쉽게 달도록 해줌
- *더 많은 정보는 https://github.com/preservim/nerdcommenter*

### ~~2-6 zxqfl/tabnine-im~~  
* ~~자동 완성 프레임워크~~  
* ~~더 많은 정보는 https://tabnine.com/semantic*~~  

### 2-7. nathanaelkane/vim-indent-guides
* 인덴트 수준을 시각적으로 보여줌
- *더 많은 정보는 https://github.com/nathanaelkane/vim-indent-guides*

### 2-8. vim-airline/vim-airline
* VIM 하단의 상태바에 더 많은 정보를 보여줌
* 정보: 현재 모드 | Git branch | 파일 이름 | 파일 타입 | 파일 인코딩 | 현재 줄 위치 | 플러그인에서 나온 경고/에러
- *더 많은 정보는 https://github.com/vim-airline/vim-airline*

### 2-9. airblade/vim-gitgutter
* Git과 관련하여 바뀐 라인들을 표시해줌
- *더 많은 정보는 https://github.com/airblade/vim-gitgutter*

### 2-10. nanotech/jellybeans.vim
* "jellybeans" 컬러 테마
- *더 많은 정보는 https://github.com/nanotech/jellybeans.vim*

### 2-11. ctrlpvim/ctrlp.vim
* 파일을 더 쉽게, 더 빠르게 열게 해줌
* (원랜 fzf였으나 vim-airline과의 연동 문제로 ctrlp으로 바꿈)
* 대표 사용법: Ctrl + p
- *더 많은 정보는 https://github.com/ctrlpvim/ctrlp.vim*

### 2-12. terryma/vim-multiple-cursors
* 여러 줄에서 대상을 선택하게 해줌
- *더 많은 정보는 https://github.com/terryma/vim-multiple-cursors*

### 2-13. Raimondi/delimitMate
* 괄호나 따옴표같은 것들을 자동으로 완성해줌
- *더 많은 정보는 https://github.com/Raimondi/delimitMate*

### 2-14. terryma/vim-smooth-scroll
* 스크롤을 더 자연스럽게 해줌
- *더 많은 정보는 https://github.com/terryma/vim-smooth-scroll*

### 2-15. tpope/vim-surround
* 괄호나 따옴표들을 쉽게 생성하고, 교체해줌
* 대표 사용법:
* cs'" => 양 옆의 '를 "로 바꿔줌
* Ctrl + v -> Shift + S + " => 양 옆을 "로 감싸줌
- *더 많은 정보는 https://github.com/tpope/vim-surround*

### 2-16. pbondoer/vim-42header
* 42프로젝트를 위한 VIM 헤더
* 대표 사용법: F1을 누르면 42헤더가 삽입됨
- *더 많은 정보는 https://github.com/pbondoer/vim-42header*

### 2-17. easymotion/vim-easymotion
* 커서를 더 쉽게 움직임
- *더 많은 정보는 https://github.com/easymotion/vim-easymotion*

### 2-18. edkolev/promptline.vim
* VIM 안에서 쉘을 만들어줌
* 대표 사용법: :PromptlineSnapshot
- *더 많은 정보는 https://github.com/edkolev/promptline.vim*

### 2-19. xuhdev/SingleCompile
* VIM 안에서 컴파일하게 해줌
* 대표 사용법: F9 => 컴파일, F10 => 컴파일 후 실행
- *더 많은 정보는 https://github.com/xuhdev/SingleCompile*

### 2-20. pangloss/vim-simplefold
* 기능 단위로 코드를 접을 수 있게 함 (ex. 함수, While루프, 등등)
- *더 많은 정보는 https://github.com/pangloss/vim-simplefold*

### 2-21. vim-scripts/WhiteWash
* 필요없는 공백 문자들을 제거함
* ^M 을 눌러 모든 불필요한 공백 문자들을 제거
- *더 많은 정보는 https://github.com/vim-scripts/WhiteWash*
***
## 3. VIM 고유 설정
### 3-1. set nocompatible
* 방향키로 커서를 이동할 수 있게 함

### 3-2. set number
* 라인 넘버를 표시함

### 3-3. set cindent
* C 스타일로 인덴트 해줌

### 3-4. set autoindent
* 자동 인덴팅

### 3-5. set smartindent
* 스마트 인덴팅

### 3-6. set hlsearch
* 검색 결과를 강조함

### 3-7. set tabstop=4
* 탭 키가 4 스페이스가 되도록 설정함

### 3-8. set shiftwidth=4
* 시프트가 4 스페이스가 되도록 설정함

### 3-9. set mouse=a
* 마우스를 사용할 수 있게 함

### 3-10. set cursorline
* 현재 커서가 위치한 라인을 강조함

### 3-11. color jellybeans
* 컬러 테마를 "jellybeans"로 설정함

### 3-12. nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>
* F5를 눌러 모든  공백 문자들을 제거함
  
***
## 4. 커스터마이징
* 이 프로젝트의 .sh 파일들을 커스터마이징 하려면, 쉘 스크립트 가이드를 참고해야 합니다.
* 가이드는 여기서 참고하실 수 있습니다.: <https://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf>
* 플러그인에 변화가 생길 경우, ':PlugClean'을 까먹지 마세요!
***
## 5. 피드백
* fleming@kakao.com 으로 메일 주세요.
