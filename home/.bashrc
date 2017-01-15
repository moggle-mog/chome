# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ll='ls -lh'
alias l='ll'
alias la='ll -a'
alias cls='clear'
alias vi='vim'
alias ..='cd ../'
alias ...='cd ../../'
alias free='free -h'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias tmns='tmux -2 new-session'
alias tmnw='tmux -2 new-window'
alias tmas='tmux -2 attach-session'
alias tmkw='tmux -2 kill-window'
alias tmsw='tmux -2 select-window'

lias rt=trash
alias lt='ls ~/.trash'
alias ut=undelfile
alias ct=cleartrash

undelfile()
{
        [ -z "$@"   ] && echo "need file" && return 1
            mv -i ~/.trash/$@ ./

}
trash()
{
        [ -z "$@"   ] && echo "need file" && return 1
            mv $@ ~/.trash/

}
cleartrash()
{
        read -p "clear sure?[y/Y/n]" confirm
            [ $confirm == 'y'   ] || [ $confirm == 'Y'   ]  && /bin/rm -rf ~/.trash/*

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
if type ctags >/dev/null 2>&1 ;then
    alias ctags-c='ctags -R --c-types=+p --fields=+S *'
    alias ctags-c++='ctags -R –c++-kinds=+px –fields=+iaSl –extra=+q .'
    alias ctags-php='ctags -R --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php'
fi
if type cscope >/dev/null 2>&1;then
    alias cscope-find="find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.php' > cscope.files"
    alias cscope-make='cscope -bkq -i cscope.files'
fi

find $HOME/.trash -ctime 7 -type f -name "*" -exec /bin/rm {} \; > /dev/null 2>&1
[[ -s ~/.autojump/etc/profile.d/autojump.sh  ]] && . ~/.autojump/etc/profile.d/autojump.sh
