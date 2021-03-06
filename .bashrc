# Mac ##########################################################################
if [ `uname` = Darwin ]; then

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

[[ -f ~/.anyenv/bin/anyenv ]] && export PATH="$HOME/.anyenv/bin:$PATH" && eval "$(anyenv init -)"

[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
[[ -d `brew --prefix`/share/git-core/contrib/diff-highlight ]] && export PATH=`brew --prefix`/share/git-core/contrib/diff-highlight:$PATH
[[ -d `brew --prefix`/opt/android-sdk ]] && export ANDROID_HOME=`brew --prefix`/opt/android-sdk && export PATH=$ANDROID_HOME/tools:$PATH

export LC_CTYPE=ja_JP.UTF-8

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias ll='ls -lwF'
alias la='ls -A'
alias ls='ls -F'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias 1l='cat ~/.oneliners'
alias 1lg='cat ~/.oneliners | grep'

eval "$(direnv hook bash)"

# CentOS #######################################################################
elif [ -f /etc/redhat-release ]; then

[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

# Ubuntu #######################################################################
#elif [ -f /etc/lsb-release ]; then

fi
# Common #######################################################################

[[ -f $HOME/.aliases ]] && source $HOME/.aliases
[[ -s $HOME/.awsrc ]] && source $HOME/.awsrc

[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:fi=0:ln=95:so=91:pi=91:ex=93:bd=91;46:cd=91:or=37:mi=37:*.rpm=92'

[[ `type __git_ps1 2>/dev/null` ]] && GIT_BRANCH='$(__git_ps1)'
if [ `uname` = Darwin ]; then PROMPT_COLOR=34; else PROMPT_COLOR=31; fi
export PS1="\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$GIT_BRANCH \n\[\033[01;"$PROMPT_COLOR"m\]\$\[\033[00m\] "

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTTIMEFORMAT="%F %T "
shopt -u histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
