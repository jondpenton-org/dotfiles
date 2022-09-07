#!/usr/bin/env bash

brew upgrade

if [[ ! $(command -v carapace) ]]; then
  brew tap rsteube/homebrew-tap
  brew install rsteube/tap/carapace
fi

if [[ ! $(command -v nu) ]]; then
  brew install nushell
fi

if [[ ! $(command -v starship) ]]; then
  brew install starship
fi

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}"

cp "$_source_dir/.bash_aliases" /home/gitpod/.bash_aliases
