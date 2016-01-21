####使用须知
1. 直接拷贝到指定目录即可使用
2. 覆盖原始文件前请做好备份

####vim
1. 准备文件和目录
```shell
cp -r .vimrc ~/
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.views
```
2. vim快捷键
TODO：

####ZSH
1. 准备软件
```shell
cp -r .zshrc ~/
yum install zsh
```
2. 重启shell，加载zsh
```shell
chsh -s /bin/zsh
```
3. zsh快捷键
TODO：

####BASH
1. 准备文件
```shell
cp -r .bash_logout ~/
cp -r .bash_profile ~/
cp -r .bashrc ~/
```
2. 更换shell为bash
```shell
chsh -s /bin/bash
```
3. bash快捷键
TODO:

####GEM
```shell
cp -r .gemrc ~/
```

####git
1. 准备
```shell
yum install git
cp -r .gitconfig ~/
```
2. 快捷键
TODO:

####tmux
1. 准备
```shell
yum install tmux
cp -r .tmux.conf ~/
```
2. 快捷键
TODO:
