# .bash_profile

# User specific environment and startup programs

type vim >/dev/null 2>&1 && export EDITOR=vim 
export TERM=xterm-256color
export PATH="$PATH:/usr/local/sbin"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

