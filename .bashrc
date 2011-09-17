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
alias pow="cd $HOME/Library/Application\ Support/Pow/Hosts/"

# use MacVim-KaoryYa
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# MacPorts Installer addition: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Bash completion
if [ -f /opt/local/etc/bash_completion ]; then
	source /opt/local/etc/bash_completion
fi

# Apache2 (MacPorts)
export PATH=/opt/local/apache2/bin:$PATH
# MySQL (DMG package)
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_FALLBACK_LIBRARY_PATH

export JAVA_HOME=/Library/Java/Home

elif [ `uname` = Linux ]; then
#
# CentOS
################################################################################
if [ -f /etc/redhat-release ]; then

export EDITOR=vim
#export JAVA_HOME='/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0/jre'

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
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
export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f $BASH_COMPLETION_DIR/git ]; then
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

# AWS
[[ -s $HOME/.awsrc ]] && source $HOME/.awsrc
# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm # This loads RVM into a shell session.
