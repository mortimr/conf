#! /bin/bash

install_node() {
  brew install nvm > /dev/null 2>&1
  mkdir -p ~/.nvm > /dev/null 2>&1
  ln -s $(brew --prefix nvm)/nvm.sh ~/.nvm/nvm.sh > /dev/null 2>&1
  git clone git://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper > /dev/null 2>&1
  fish -c 'nvm install 8' > /dev/null 2>&1
}

install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

command -v brew >/dev/null 2>&1 || { echo >&2 "Homebrew required. Installing ..."; install_homebrew; }

echo "# Installing fish, hub, git-flow"
brew install fish hub git-flow > /dev/null 2>&1

echo "# Setting default shell to fish"
sudo chsh -s /usr/local/bin/fish ${USER} > /dev/null 2>&1

echo "# Copying fish functions"
mkdir -p ~/.config/fish/functions
cp ./functions/*.fish ~/.config/fish/functions/

if ! brew ls --versions nvm; then
  echo >&2 "# NVM required. Installing ..."; install_node;
fi

cp ./config.fish ~/.config/fish/

fish -c 'npm install -g taskbook'
fish -c 'gem install timetrap'
