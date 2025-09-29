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
