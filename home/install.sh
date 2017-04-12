#! /bin/bash
mkdir -p $HOME/.dotfiles

git clone --depth=1 git://github.com/joelthelion/autojump.git && \
cd autojump && \
./uninstall.py && \
./install.py && \
cd ../ && \
rm -rf autojump

cp -f .bashrc.user $HOME/

echo "[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user" >> $HOME/.bashrc

command -v zsh &>/dev/null || \
( (command -v dnf &>/dev/null && sudo dnf -y install zsh) || \
(command -v yum &>/dev/null && sudo yum -y install zsh) || \
(command -v apt-get &>/dev/null && sudo apt-get install zsh) || \
(command -v brew &>/dev/null && brew install zsh) || \
(command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

export ZSH="$HOME/.dotfiles/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp -f .zshrc.user $HOME/
echo "[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user" >> $HOME/.zshrc
echo "[ -f $HOME/.zshrc.user ] && source $HOME/.zshrc.user" >> $HOME/.zshrc

cp -f .gitconfig $HOME/
cp -f .tmux.conf $HOME/
command -v tmux &>/dev/null || \
( (command -v dnf &>/dev/null && sudo dnf -y install tmux) || \
(command -v yum &>/dev/null && sudo yum -y install tmux) || \
(command -v apt-get &>/dev/null && sudo apt-get install tmux) || \
(command -v brew &>/dev/null && brew install tmux) || \
(command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )
