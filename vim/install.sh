#! /bin/bash
## -------------------- CHECK --------------------
command -v git &>/dev/null || ( (command -v dnf &>/dev/null && sudo dnf -y install git) || (command -v yum &>/dev/null && sudo yum -y install git) || (command -v apt-get &>/dev/null && sudo apt-get install git) || (command -v brew &>/dev/null && brew install git) || (command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

command -v ag &>/dev/null || ( (command -v dnf &>/dev/null && sudo dnf -y install the_silver_searcher) || (command -v yum &>/dev/null && sudo yum -y install the_silver_searcher) || (command -v apt-get &>/dev/null && sudo apt-get install silversearcher-ag) || (command -v brew &>/dev/null && brew install the_silver_searcher) || (command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

command -v ag &>/dev/null || ( (command -v dnf &>/dev/null && sudo dnf -y install the_silver_searcher) || (command -v yum &>/dev/null && sudo yum -y install the_silver_searcher) || (command -v apt-get &>/dev/null && sudo apt-get install silversearcher-ag) || (command -v brew &>/dev/null && brew install the_silver_searcher) || (command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

command -v ctags &>/dev/null || ( (command -v dnf &>/dev/null && sudo dnf -y install ctags) || (command -v yum &>/dev/null && sudo yum -y install ctags) || (command -v apt-get &>/dev/null && sudo apt-get install ctags) || (command -v brew &>/dev/null && brew install ctags) || (command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )
## -------------------- PROCESS --------------------
[ -f $HOME/.vimrc ] && mv -f $HOME/.vimrc{,.bak}
mkdir -p $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/vundle ]
then
    git clone --depth=1 https://github.com/gmarik/vundle.git || exit 1
    mv -f vundle $HOME/.vim/bundle/
fi

mkdir -p $HOME/.vim/.backup
mkdir -p $HOME/.vim/.views

mkdir -p /tmp/.vim/.undo
## -------------------- INSTALL --------------------
[ ! -f .vimrc.bundle ] && (echo ".vimrc.bundle 不存在" &&  exit 1)
vim -u .vimrc.bundle '+set nomore' '+BundleInstall!' '+BundleClean' '+qall' || (echo "请重试" && exit 1)
## -------------------- ENDING --------------------
ln -sf $HOME/.vim/bundle/vim-colorschemes/colors -T $HOME/.vim/colors || exit 1

cp -f .vimrc $HOME/
echo "安装完成"