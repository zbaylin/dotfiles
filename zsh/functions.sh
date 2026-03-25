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

function bw-unlock {
  SESSION="$(bw unlock --raw)"

  export BW_SESSION="$SESSION"
}

function ssh-bw {
  NAME="$1"

  if [ -z "$BW_SESSION" ]; then
    bw-unlock
  fi

  if [ -z "$NAME" ]; then
    printf "[ERROR] name must be specified\n" >&2
    return 1
  fi

  PW=$(bw list items | jq -r ".[] | select(.name == \"$NAME\") | .login.password")

  PW_CNT=$(echo "$PW" | wc -l)

  if [ -z "${PW}" ]; then
    printf "[ERROR] no password found\n" >&2
    return 1
  elif [ "$PW_CNT" -ne "1" ]; then
    printf "[ERROR] name not unique\n" >&2
    return 1
  fi

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
