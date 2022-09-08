#!/usr/bin/env bash

brew update
brew upgrade

if [[ ! $(command -v carapace) ]]; then
  echo 'Installing carapace...'
  brew tap rsteube/homebrew-tap
  brew install rsteube/tap/carapace
fi

if [[ ! $(command -v nu) ]]; then
  # echo 'Reinstalling gcc...'
  # brew reinstall gcc@11 # Broken dependency
  echo 'Installing nu...'
  # sudo apt-get install --yes gcc-multilib
  # export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
  brew install nushell
  # brew reinstall nushell # Account for libgcc error
fi

if [[ ! $(command -v starship) ]]; then
  echo 'Installing starship...'
  brew install starship
fi

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}"

cp "$_source_dir/.bash_aliases" /home/gitpod/.bash_aliases
