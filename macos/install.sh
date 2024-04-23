#!/usr/bin/env bash

# use set -e instead of #!/bin/bash -e in case we're
# called with `bash ~/bin/scriptname`
set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

if [ "$(uname -s)" == "Darwin" ]; then
    echo "On a Mac progressing"

    brew install jq
    brew install --cask firefox
    brew install --cask java
    brew install --cask iterm2
    brew install --cask ccat
    echo "Installed base apps"

    # .Net
    brew install --cask dotnet-sdk
    echo "Installed SDK's"

    # Install go
    brew install golang
    mkdir -p $GOPATH $GOPATH/src $GOPATH/pkg $GOPATH/bin
    echo "Installed development languages"

    # ZSH install (not Oh my zsh)
    # brew install zsh
    # chsh -s /bin/zsh
    brew install zsh-syntax-highlighting
    brew install zsh-autosuggestions
    echo "Installed ZSH extensions"

    # MSFT Stuff and extensions for VSCode
    brew install --cask visual-studio-code
    sh ./vscode-ext.sh
    echo "Installed developement apps and plugins"

    # install terminal screen recorder
    brew install asciinema
    echo "Installed screen readers"

    # docker stuff
    brew install docker-clean
    brew install docker-completion
    brew install docker-compose-completion
    echo "Installed docker extensions"

    # Install apps from the store
    # install mas-cli to install from the Mac App store
    brew install mas
    echo "Installed Mac App Store cli"

    # Nerd Fonts
    brew tap caskroom/fonts
    brew install --cask font-hack-nerd-font
    echo "Installed fonts"

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
    echo "Installed Mac App Store apps"

else
    echo "Not running OSX therefore skipping Homebrew install"
fi