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
  _source_dir="$(readlink -f "$0")" && echo "${_source_dir%/*}"
fi
