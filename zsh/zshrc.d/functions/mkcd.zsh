function mkcd {
  if [[ -n ${1} ]]; then
    mkdir -p -- ${1} && builtin cd -- ${1}
  fi
}
