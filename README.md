# dotfiles

Use the same environment everywhere.

## macOS Monterey

```sh
# Command Line Tools
xcode-select --install
sudo xcode-select -switch /Library/Developer/CommandLineTools

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"
curl https://raw.githubusercontent.com/deeeki/dotfiles/main/.Brewfile -o ~/.Brewfile
brew bundle -v --global

# Mackup
mackup restore

# Neovim
pip3 install pynvim
```
