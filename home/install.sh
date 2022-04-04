#! /bin/bash

function install() {
    cmd="$1"
    ((command -v yum &>/dev/null && sudo yum -y install ${cmd}) || \
    (command -v dnf &>/dev/null && sudo dnf -y install ${cmd}) || \
    (command -v apt-get &>/dev/null && sudo apt-get install ${cmd}) || \
    (command -v brew &>/dev/null && brew install ${cmd}) || exit 1 )
}

# 安装zsh
install zsh
install curl
install tmux

# 同步更多的配置文件
cp -f .gitconfig $HOME/
cp -f .tmux.conf $HOME/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz plugin enable z docker kubectl
omz theme set suvash
cp *.zsh $ZSH/custom
