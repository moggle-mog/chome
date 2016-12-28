##流程
```shell
mkdir -p $HOME/.dotfiles

#autojump
git clone --depth=1 https://github.com/joelthelion/autojump.git
cd autojump
./install.py --destdir=$HOME/.dotfiles/autojump
cd -
rm -rf autojump

#oh-my-zsh
export ZSH="$HOME/.dotfiles/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp -f .bashrc.user $HOME/
echo "[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user" >> $HOME/.bashrc

cp -f .gitconfig $HOME/
cp -f .tmux.conf $HOME/

cp -f .zshrc.user $HOME/
echo "[ -f $HOME/.bashrc ] && source $HOME/.bashrc" >> $HOME/.zshrc
echo "[ -f $HOME/.zshrc.user ] && source $HOME/.zshrc.user" >> $HOME/.zshrc
```

##快捷键
#####autojump
```
j foo       跳转到 foo 目录
jc bar      跳转到 bar 的子目录
jo music    用资源管理器打开 music 目录(前提是操作系统要有图形界面)
jco images  用资源管理器打开 images 子目录(前提是操作系统要有图形界面)
```