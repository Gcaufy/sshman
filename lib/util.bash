#!/bin/bash

cyan="$(tput setaf 6)"
normal="$(tput sgr0)"

log() {
    printf '\033[0;34m%s\033[0m\n' "${1}"
}
info() {
    printf "\e[34m[⊚] %s\e[0m\n" "${1}"
}
error() {
    printf "\e[31m[✘] %s\e[0m\n" "${1}"
}
warn() {
    printf "\e[93m[♨] %s\e[0m\n" "${1}"
}
success() {
    printf "\e[32m[✔] %s\e[0m\n" "${1}"
}
prompt() {
  local _prompt=$1
  local _text=$2
  local _read_prompt_start=$'\e[32m?\e[39m\e[1m'
  local _read_prompt_end=$'\e[22m'
  echo "$_read_prompt_start $_prompt ${cyan}${_text}${normal} $_read_prompt_end"
}
link() {
    if [ -L "${2}" ]; then
        unlink "${2}"
    elif [ -e "${2}"  ]; then
        info "Existing ${2} found, Moving ${2} -> ${2}.previous"
        mv "${2}" "${2}".previous
    fi
    ln -s "${1}" "${2}"
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
