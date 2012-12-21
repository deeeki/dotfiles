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
export LS_COLORS='di=36:fi=0:ln=95:so=91:pi=91:ex=93:bd=91;46:cd=91:or=37:mi=37:*.rpm=92'

[[ -f $BASH_COMPLETION_DIR/git ]] && GIT_BRANCH='$(__git_ps1)'
if [ `uname` = Darwin ]; then
	PROMPT_COLOR=34
else
	PROMPT_COLOR=31
fi
export PS1="\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$GIT_BRANCH \n\[\033[01;"$PROMPT_COLOR"m\]\$\[\033[00m\] "

# AWS
[[ -s $HOME/.awsrc ]] && source $HOME/.awsrc

# rbenv
[[ -x `which rbenv` ]] && eval "$(rbenv init -)"
