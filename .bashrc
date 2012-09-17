#
# Mac
################################################################################
if [ `uname` = Darwin ]; then
alias ll='ls -lwF'
alias la='ls -A'
alias ls='ls -F'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias oneliners="curl https://raw.github.com/gist/1073624/oneliners.sh"

export LC_CTYPE=ja_JP.UTF-8

# use MacVim-KaoryYa
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	source `brew --prefix`/etc/bash_completion
fi

elif [ `uname` = Linux ]; then
#
# CentOS
################################################################################
if [ -f /etc/redhat-release ]; then

export EDITOR=vim

if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi
#
# Ubuntu
################################################################################
elif [ -f /etc/lsb-release ]; then

export EDITOR=vim

fi
fi
#
# Common
################################################################################
[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f $BASH_COMPLETION_DIR/git ]; then
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

# AWS
[[ -s $HOME/.awsrc ]] && source $HOME/.awsrc

# rbenv
eval "$(rbenv init -)"
