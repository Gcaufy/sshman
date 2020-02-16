#!/bin/bash

log() {
    printf '\033[0;34m%s\033[0m\n' "${1}"
}
info() {
    printf "\e[34m[I]\e[0m ${1}\n"
}
error() {
    printf "\e[31m[✘]\e[0m ${1}\n"
}
success() {
    printf "\e[32m[✔]\e[0m ${1}\n"
}
link() {
    if [ -L ${2} ]; then
        unlink ${2}
    elif [ -e ${2}  ]; then
        info "Existing ${2} found, Moving ${2} -> ${2}.previous"
        mv ${2} ${2}.previous
    fi
    ln -s ${1} ${2}
    success "${2}   -> ${1}"
}

# Check if a command exists
function exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check num, >= min && <= max
function numberin () {
  local _seq=$1
  local _min=$2
  local _max=$3
  local _re='^[0-9]+$'
  if ! [[ $_seq =~ $_re ]] ; then
     echo false
  elif ! [[ $_seq -ge $_min && $_seq -le $_max  ]]; then
    echo false
  else
    echo true
  fi
}
