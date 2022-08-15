if [[ -z $(ls ~/.config | grep nushell) ]]; then
  while :; do
    _credentials=$(echo "host=github.com" | gp credential-helper get)

    echo $_credentials

    _password=$(echo $_credentials | grep password=)

    if [[ -n $_password ]]; then
      break
    else
      echo "Waiting for credentials..."
      sleep 1
    fi
  done

  echo "Creating and cloning nushell-files..."

  git clone https://github.com/jondpenton-org/dotfiles.git ~/.config/nushell/
fi