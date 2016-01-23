# .bash_profile

# User specific environment and startup programs
export PATH="$HOME/.local/bin:$HOME/bin"

type vim >/dev/null 2>&1 && export EDITOR=vim 

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
