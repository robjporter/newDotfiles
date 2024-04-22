#!/usr/bin/env bash

# use set -e instead of #!/bin/bash -e in case we're
# called with `bash ~/bin/scriptname`
set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

if [ "$(uname -s)" == "Darwin" ]; then

    brew install jq

    brew cask install camtasia
    brew cask install docker
    brew cask install firefox
    brew cask install java
    brew cask install iterm2
    brew install ccat

    # .Net
    # brew cask install dotnet
    brew cask install dotnet-sdk

    # Install go
    brew install golang
    mkdir -p $GOPATH $GOPATH/src $GOPATH/pkg $GOPATH/bin

    # brew cask install istat-menus

    # ZSH install (not Oh my zsh)
    # brew install zsh
    # chsh -s /bin/zsh
    brew install zsh-syntax-highlighting
    brew install zsh-autosuggestions

    # MSFT Stuff and extensions for VSCode
    # brew cask install visual-studio
    brew cask install visual-studio-code
    sh ./vscode-ext.sh

    # install terminal screen recorder
    brew install asciinema

    # docker stuff
    brew install docker-clean
    brew install docker-completion
    brew install docker-compose-completion

    # Buildpacks
    brew tap buildpack/tap
    brew install pack

    # Install apps from the store
    # install mas-cli to install from the Mac App store
    brew install mas

    # Nerd Fonts
    brew tap caskroom/fonts
    brew cask install font-hack-nerd-font

    # get Apple ID
    # echo ""
    # echo "Enter AppleID to signin to Mac App Store:"
    # read -p "  AppleID (john@foo.com): " APPLEID

    # install macos apps (mas list provides the req info)
    mas install 497799835 # Xcode
    mas install 1278508951 # Trello
    mas install 585829637 # Todoist
    mas install 1176895641 # Spark
    mas install 1295203466 # Microsoft Remote Desktop 

else
    echo "Not running OSX therefore skipping Homebrew install"
fi