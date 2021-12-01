[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f ~/.anyenv/bin/anyenv ]] && export PATH="$HOME/.anyenv/bin:$PATH" && eval "$(anyenv init -)"
[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH
