#!/usr/bin/env bash

# Install software.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install vim and replace system vi(m)
brew install vim --with-override-system-vi

# Install other useful tools
brew install git tmux thefuck ack the_silver_searcher rg tree nmap xz wget shellcheck reattach-to-user-namespace

# Use homebrew's Ruby rather than system ruby.
# This lets you install gems without needing sudo/root
brew install ruby ruby-build rbenv

# Remove outdated versions from the cellar.
brew cleanup

gem install puppet-lint r10k --no-doc --no-ri

# Puppet specific tools
brew cask install visual-studio-code
brew cask install pdk

brew cask install virtualbox
brew cask install firefox
brew install gdrive
brew cask install the-unarchiver
brew cask install spotify
