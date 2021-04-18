# Mac ##########################################################################
[[ -f ~/.anyenv/bin/anyenv ]] && export PATH="$HOME/.anyenv/bin:$PATH" && eval "$(anyenv init -)"

[[ -d `brew --prefix`/share/git-core/contrib/diff-highlight ]] && export PATH=`brew --prefix`/share/git-core/contrib/diff-highlight:$PATH

export LC_CTYPE=ja_JP.UTF-8

alias ll='ls -lwF'
alias la='ls -A'
alias ls='ls -F'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias 1l='cat ~/.oneliners'
alias 1lg='cat ~/.oneliners | grep'

# Common #######################################################################
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:fi=0:ln=95:so=91:pi=91:ex=93:bd=91;46:cd=91:or=37:mi=37:*.rpm=92'

autoload -U compinit && compinit -u
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}"
zstyle ':vcs_info:git:*' stagedstr "%F{cyan}"
zstyle ':vcs_info:*' formats "%F{yellow}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '%K{magenta}(%b|%a)%k'
precmd () { vcs_info }
if [ `uname` = Darwin ]; then PROMPT_COLOR=blue; else PROMPT_COLOR=red; fi
PROMPT='%B%F{green}%n@%m%f %F{yellow}%~%f $vcs_info_msg_0_
%F{$PROMPT_COLOR}%#%f%b '

export SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history
