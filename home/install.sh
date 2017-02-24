#! /bin/bash
mkdir -p $HOME/.dotfiles

command -v zsh &>/dev/null || \
( (command -v dnf &>/dev/null && sudo dnf -y install zsh) || \
(command -v yum &>/dev/null && sudo yum -y install zsh) || \
(command -v apt-get &>/dev/null && sudo apt-get install zsh) || \
(command -v brew &>/dev/null && brew install zsh) || \
(command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

command -v tmux &>/dev/null || \
( (command -v dnf &>/dev/null && sudo dnf -y install tmux) || \
(command -v yum &>/dev/null && sudo yum -y install tmux) || \
(command -v apt-get &>/dev/null && sudo apt-get install tmux) || \
(command -v brew &>/dev/null && brew install tmux) || \
(command "过程被中断,或者使用了不支持的包管理工具" && exit 1) )

export ZSH="$HOME/.dotfiles/oh-my-zsh"
rm -rf $ZSH
command -v j &>/dev/null || \
git clone --depth=1 git://github.com/joelthelion/autojump.git && \
cd autojump && \
./uninstall.py && \
./install.py && \
cd ../ && \
rm -rf autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#autojump installer
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
command -v j &>/dev/null || (\
git clone --depth=1 git://github.com/joelthelion/autojump.git && \
cd autojump && \
./uninstall.py && \
./install.py && \
cd ../ && \
rm -rf autojump)

cp -f .gitconfig $HOME/
cp -f .tmux.conf $HOME/
cp -f .zshrc.user $HOME/
cp -f .bashrc.user $HOME/
echo "[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user" >> $HOME/.bashrc
echo "[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user" >> $HOME/.zshrc
echo "[ -f $HOME/.zshrc.user ] && source $HOME/.zshrc.user" >> $HOME/.zshrc


echo "安装结束"
