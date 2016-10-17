
####**准备**
```bash
yum -y install yum-fastestmirror
yum clean all
yum -y update

yum -y install git
yum -y install lrzsz
yum -y install screen
yum -y install zsh
yum -y install scope
yum -y install ctags
git clone git@github.com:u2bnone/chome.git
cd chome/advanced
```
####**vim**
1.安装vim7.4以上版本
2.创建目录
```shell
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.views
mkdir -p ~/.vim/.undo
mkdir -p ~/.vim/cscope
mkdir -p ~/.vim/bundle/vundle
```
3.配置.vimrc
```shell
cp -f .vimrc ~/
cp -f .vimrc.bundles ~/
```
4.安装vim插件
```shell
git clone -b master https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
vim -u '~/.vimrc.bundles' '+set nomore' '+BundleInstall!' '+BundleClean' '+qall'
```
5.配置样式
```shell
cd ~/.vim
ln -s bundle/vim-colorschemes/colors colors
cd -
```
####**zsh**
1.安装[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh "Oh-my-zsh")
```shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2.安装[autojump](https://github.com/wting/autojump "autojump")
```shell
git clone https://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ../
rm -rf autojump
```
3.配置.zshrc
```shell
cp -f .zshrc ~/
```
4.zsh快捷键
TODO：
####**git**
1.配置git
```bash
cp -f .gitconfig ~/
```
2.git快捷键
TODO:
####**tmux**
1.配置tmux
```bash
cp -f .tmux.conf ~/
```
2.tmux快捷键
TODO：
####**GEM**
1.配置gem
```bash
cp -f .gemrc ~/
```
