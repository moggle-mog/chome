type vim >/dev/null 2>&1 && export EDITOR=vim
export TERM=xterm-256color

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

#export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.local/bin:$HOME/bin"

alias ll='ls -lh'
alias l='ll'
alias la='ll -a'
alias ..='cd ../'
alias ...='cd ../../'
alias lsd='ls -l | grep "^d"'

alias cls='clear'
alias free='free -h'

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

alias tmns='tmux -2 new-session'
alias tmnw='tmux -2 new-window'
alias tmas='tmux -2 attach-session'
alias tmkw='tmux -2 kill-window'
alias tmsw='tmux -2 select-window'

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
    session_name="operational"
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
