# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:$HOME/.local/bin:$HOME/bin"
export CSCOPE_DB=$HOME/.vim/cscope/cscope.out
export TERM=xterm-256color

type vim >/dev/null 2>&1 && export EDITOR=vim
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cls='clear'
alias lsd='ls -l | grep "^d"'
alias ..='cd ../'
alias ...='cd ../../'
alias free='free -h'
alias tmns='tmux -2 new-session'
alias tmnw='tmux -2 new-window'
alias tmas='tmux -2 attach-session'
alias tmkw='tmux -2 kill-window'
alias tmsw='tmux -2 select-window'
alias lsd='ls -l | grep "^d"'

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

alias rt=trash
alias lt='ls ~/.trash'
alias ut=undelfile
alias ct=cleartrash

undelfile()
{
    [ -z "$@"  ] && echo "need file" && return 1
    mv -i ~/.trash/$@ ./
}
trash()
{
    [ -z "$@"  ] && echo "need file" && return 1
    mv $@ ~/.trash/
}
cleartrash()
{
    read -p "clear sure?[y/Y/n]" confirm
    [ $confirm == 'y'  ] || [ $confirm == 'Y'  ]  && /bin/rm -rf ~/.trash/*
}

tmux_init()
{
    session_name="develop"
    tmns -s $session_name -n "editor" -d
    tmnw -n "console" -t $session_name
    tmsw  -t $session_name:1
    #tmux send-keys -t development 'cd ~/devproject' C-m
    #tmux send-keys -t development 'vim' C-m
    #tmux select-layout -t development main-horizontal
    #tmux send-keys -t development:1.2 'cd ~/devproject' C-m
    #tmux send-keys -t development:2 'cd ~/devproject' C-m
    #tmux split-window -v -p 10 -t development
    #tmux split-window -h
    #tmux split-window -v "top" -t $session_name
    tmas -d
}
alias dt='type tmux >/dev/null 2>&1 &&  test -z "$TMUX" && (tmas >/dev/null 2>&1 || tmux_init)'
find $HOME/.trash -ctime 7 -type f -name "*" -exec /bin/rm {} \; > /dev/null 2>&1
if type ctags >/dev/null 2>&1 ;then
    alias ctags-c='ctags -R --c-types=+p --fields=+S *'
    alias ctags-c++='ctags -R –c++-kinds=+px –fields=+iaSl –extra=+q .'
    alias ctags-php='ctags -R --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php'
fi
if type cscope >/dev/null 2>&1;then
    alias cscope-make="find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.php' | cscope -bkq"
fi
[[ -s ~/.autojump/etc/profile.d/autojump.sh   ]] && . ~/.autojump/etc/profile.d/autojump.sh
