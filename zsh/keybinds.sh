# Have CTRL-Z toggle fg and bg
ctrl_z () { 
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

zle -N ctrl_z

bindkey "^Z" ctrl_z
