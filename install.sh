#!/bin/bash

xcode-select --install

brew update
brew upgrade

brew install coreutils
brew install moreutils
brew install gnu-sed --with-default-names

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install neovim
brew install git
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
git clone https://github.com/ericbastarache/dotfiles.git
cd dotfiles
cp .tmux.conf.local ~/.tmux.conf.local
#cp .tmux/.tmux.conf.local .
brew install fzf
brew install node
git clone https://github.com/ericbastarache/todos-cli.git
cd todos-cli
npm i -g

brew cleanup
