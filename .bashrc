# Mac ##########################################################################
if [ `uname` = Darwin ]; then

[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

[[ -f `brew --prefix`/bin/rbenv ]] && eval "$(rbenv init -)"

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

# CentOS #######################################################################
elif [ -f /etc/redhat-release ]; then

[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

# Ubuntu #######################################################################
#elif [ -f /etc/lsb-release ]; then

fi
# Common #######################################################################

[[ -s $HOME/.awsrc ]] && source $HOME/.awsrc

[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:fi=0:ln=95:so=91:pi=91:ex=93:bd=91;46:cd=91:or=37:mi=37:*.rpm=92'

[[ -f $BASH_COMPLETION_DIR/git ]] && GIT_BRANCH='$(__git_ps1)'
if [ `uname` = Darwin ]; then PROMPT_COLOR=34; else PROMPT_COLOR=31; fi
export PS1="\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$GIT_BRANCH \n\[\033[01;"$PROMPT_COLOR"m\]\$\[\033[00m\] "
