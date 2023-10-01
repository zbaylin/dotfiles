# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi

function opam_switch_info() {
  local swtch=$(opam switch show --safe 2>/dev/null | sed 's|.*/|*|')
  local ret
  if [[ $swtch = "default" ]]; then
    ret=""
  else
    ret="🐪 $swtch"
  fi
  echo -n $ret
}

function python_venv_info() {
  local venv=$(echo -n ${VIRTUAL_ENV//*\/})
  local ret
  if [[ $venv = "" ]]; then
    ret=""
  else
    ret="🐍 $venv"
  fi
  echo -n $ret
}

local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="╭─${user_host} ${current_dir} \$(opam_switch_info) \$(python_venv_info) ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
