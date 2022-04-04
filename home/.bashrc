# .bashrc

# User specific aliases and functions
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

## -------------------- ALIAS --------------------
alias ll='ls -lh'
alias l='ls -lh'
alias la='ls -lha'
alias lsd='ls -l | grep "^d"'
alias cls='clear'
alias ..='cd ../'
alias ...='cd ../../'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

## -------------------- EXPORT --------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## -------------------- tmux --------------------
alias tmns='tmux -2 new-session'
alias tmnw='tmux -2 new-window'
alias tmas='tmux -2 attach-session'
alias tmkw='tmux -2 kill-window'
alias tmsw='tmux -2 select-window'
alias dt='command -v tmux &>/dev/null &&  test -z "$TMUX" && (tmas >/dev/null 2>&1 || tmux_init)'

tmux_init()
{
    session_name="develop"
    tmns -s $session_name -n "editor" -d
    tmnw -n "console" -t $session_name
    tmsw -t $session_name:1
    #tmux send-keys -t $session_name 'cd ~/devproject' C-m
    #tmux send-keys -t $session_name 'vim' C-m
    #tmux select-layout -t $session_name main-horizontal
    #tmux send-keys -t $session_name:1.2 'cd ~/devproject' C-m
    #tmux send-keys -t $session_name:2 'cd ~/devproject' C-m
    #tmux split-window -v -p 10 -t $session_name
    #tmux split-window -h
    #tmux split-window -v "top" -t $session_name
    tmas -d
}
