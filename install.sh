#!/usr/bin/env bash

printenv

brew update
brew upgrade

brew tap rsteube/homebrew-tap
brew install rsteube/tap/carapace starship nushell

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}"

cp "$_source_dir/.bash_aliases" /home/gitpod/.bash_aliases
