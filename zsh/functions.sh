function pip-install-save {
  pip install $1 && pip freeze | grep $1 >> requirements.txt
}

function hex2dec {
  HEX="$1"

  python3 -c "print(int('$HEX', 16))"
}

function dec2hex {
  DEC="$1"

  python3 -c "print(hex($DEC))"
}

function ssh-bw {
  NAME="$1"

  if [ -z "$NAME" ]; then
    printf "[ERROR] name must be specified\n" >&2
    return 1
  fi

  PW="$(rbw get "$NAME" | tr -d '\n')"

  printf "unlock() { echo '%s' | sudo -S echo -n &> /dev/null; }; export -f unlock; \$SHELL -l" "$PW"
}

function today-note {
  year="$(date +"%Y")"
  month="$(date +"%m")"
  day="$(date +"%d")"

  base_path="$HOME/Notes/$year/$month"

  mkdir -p "$base_path"

  full_path="$base_path/$day.md"

  if [ ! -f "$full_path" ]; then
    touch "$full_path"
    echo "Created $full_path"
  else
    echo "$full_path already exists"
  fi
  nvim "$full_path"
}

function edit-note {
  pushd "$HOME/Notes" > "/dev/null"

  note="$(fzf)"

  if [ ! -z "$note" ]; then
    nvim "$note"
  fi

  popd > "/dev/null"
}

function render-note {
  pushd "$HOME/Notes" > "/dev/null"

  note="$(fzf)"

  if [ ! -z "$note" ]; then
    pandoc -c "https://classless.de/classless.css" -s "$note" -o "$note.html"
  fi

  popd > "/dev/null"
}
