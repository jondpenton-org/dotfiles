#!/usr/bin/env bash

brew update

if [[ ! $(command -v carapace) ]]; then
  echo 'Installing carapace...'
  brew tap rsteube/homebrew-tap
  brew install rsteube/tap/carapace
fi

if [[ ! $(command -v nu) ]]; then
  # brew reinstall gcc@11 # Broken dependency
  echo 'Installing nu...'
  apt-get install --yes gcc-multilib
  brew install nushell
fi

if [[ ! $(command -v starship) ]]; then
  echo 'Installing starship...'
  brew install starship
fi

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}"

cp "$_source_dir/.bash_aliases" /home/gitpod/.bash_aliases
