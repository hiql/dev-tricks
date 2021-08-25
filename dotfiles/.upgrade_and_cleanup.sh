#!/bin/sh
#
# A simple shell script for upgrading and cleaning, only running under MacOS
#

echo "Start upgrading..."

brew update
brew upgrade
brew cleanup --prune=0

tldr --update

npm -g update
npm cache clean -f

rustup update

# Clean shell command history
history -p
history -c

rm -rf ~/.viminfo
rm -rf ~/.zsh_history
rm -rf ~/.bash_history

echo "Done!"

