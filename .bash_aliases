brew update

if [[ ! $(command -v carapace) ]]; then
  brew tap rsteube/homebrew-tap
  brew install rsteube/tap/carapace
fi

if [[ ! $(command -v nu) ]]; then
  brew reinstall gcc@11 # Broken dependency
  brew install nushell
fi

if [[ ! $(command -v starship) ]]; then
  brew install starship
fi

if [[ -z $(ls ~/.config | grep nushell) ]]; then
  while :; do
    _credentials=$(echo "host=github.com" | gp credential-helper get)
    _password=$(echo $_credentials | grep password=)

    if [[ -n $_password ]]; then
      break
    else
      echo "Waiting for credentials..."
      sleep 1
    fi
  done

  echo "Creating and cloning nushell-files..."

  git clone https://github.com/jondpenton-org/nushell-files.git ~/.config/nushell/
  cp ~/.dotfiles/.config/nushell/login.nu ~/.config/nushell/login.nu
fi
