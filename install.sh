#!/bin/bash

xcode-select --install

brew update
brew upgrade

brew install coreutils
brew install moreutils
brew install gnu-sed --with-default-names

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install vim --with-override-system-vi
brew install git
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
brew install fzf
brew install node

brew cleanup
