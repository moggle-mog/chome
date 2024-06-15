#! /bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'
_red() { echo -e ${red}$*${none};  }
_green() { echo -e ${green}$*${none};  }
_yellow() { echo -e ${yellow}$*${none};  }
_magenta() { echo -e ${magenta}$*${none};  }
_cyan() { echo -e ${cyan}$*${none};  }

# Root
# [[ $(id -u) != 0  ]] && echo -e "\n 请使用 ${red}root ${none}用户运行${yellow}.${none}\n" && exit 1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Package
CMD="yum"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
	if [[ $(command -v apt-get) ]]; then
		CMD="apt-get"
	fi
elif [[ $(command -v brew) ]]; then
	CMD="brew"
else
	echo -e " 
	${red}该脚本${none} 不支持你的系统.${yellow}请确认代码${none}
	备注: 仅支持 ubuntu 16+ / debian 8+ / centos 7+ / macos 12+ 系统
	" && exit 1
fi

# Dependents
case $CMD in
'yum')
   yum install -y zsh curl tmux
   ;;
'apt-get')
   apt-get install -y zsh curl tmux
   ;;
'brew')
   brew install zsh curl tmux
   ;;
esac

# Config
cp -f .gitconfig $HOME/
cp -f .tmux.conf $HOME/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Init
omz plugin enable z docker kubectl
omz theme set suvash
cp *.zsh $ZSH/custom

# Load
source ~/.zshrc
