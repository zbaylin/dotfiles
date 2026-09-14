#!/usr/bin/env zsh

script_path="$0"
script_dir="$(dirname "$script_path")"

source "$script_dir/../local.sh" || exit 1

url="$(git remote get-url origin 2> /dev/null)"
url_exit_code="$?"

if [ "$url_exit_code" = "0" ]; then
  current_user="$(gh auth status --json hosts | \
    jq --raw-output '.hosts["github.com"] | .[] | select(.active).login')"

  desired_user="$(gh_desired_user "$url")"

  if [ "$current_user" != "$desired_user" ]; then
    printf '[INFO] switching to %s\n' "$desired_user" 1>&2

    gh auth switch --user "$desired_user" || exit 1
  fi
else
  printf "[WARN] not in git repo or missing gh_desired_user\n"
fi

gh $@
