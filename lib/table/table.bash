#!/bin/bash

# Author   : Gcaufy
# Date     : 2020/02/16

dbpath=""
COL_SEP="[}"

OS="$(uname)"

# Get md5 sum compatibly
function get_md5 () {
  case $OS in
    'Linux')
      echo "$1" | md5sum | cut -c1-32
      ;;
    'Darwin') 
      echo "$1" | md5 -q
      ;;
    *) ;;
  esac
}

# compatible sed in MacOS and Linux
function sedi () {
  if [[ "$OS" == "Darwin" ]]; then
    sed -i '' "$1" "$2"
  else
    sed -i "$1" "$2"
  fi
}

function table_refresh () {
  grep "^#ID:" "$dbpath" | cat > "$dbpath.tmp.deleted"
  grep "^#" "$dbpath" | grep -v "^#ID:" | cat > "$dbpath.tmp.comment"
  grep -v "^#" "$dbpath" | cat | column -t > "$dbpath.tmp.db"
  cat "$dbpath.tmp.comment" "$dbpath.tmp.db" "$dbpath.tmp.deleted" > "$dbpath"
  rm "$dbpath.tmp.db" > /dev/null 2>&1
  rm "$dbpath.tmp.comment" > /dev/null 2>&1
  rm "$dbpath.tmp.deleted" > /dev/null 2>&1
}

function table_init () {
  dbpath=$1
  _columns=$2

  if [[ ! -f "$dbpath" ]]; then
    touch "$dbpath"
    if [[ -n $_columns ]]; then
      echo "ID"$(printf "$COL_SEP%s" "${_columns[@]}") | column -t -s $"$COL_SEP" > "$dbpath"
    fi
  else
    table_refresh
  fi
}

function table_check_init () {
  if [[ ! -f "$dbpath" ]]; then
    printf '%s\n' "Please init table first" >&2  # write error message to stderr
    exit 1
  fi
}

function row_insert () {
  table_check_init

  local _row=( "$@" )
  if [[ -z ${_row[*]} ]]; then
    printf 'Error: %s\n' 'Table insert empty row' >&2
  fi
  local _rowstr=$(printf "$COL_SEP%s" "${_row[@]}")
  local _tid="ID:"$(get_md5 "$_rowstr$RANDOM" | cut -c1-10)

  echo $(printf "%s$COL_SEP%s" "$_tid" "$_rowstr") | column -t -s $"$COL_SEP" >> "$dbpath"
  table_refresh
  echo "$_tid"
}

function row_update () {
  local _row=( "$@" )
  local _id=${_row[0]}

  if [[ -z ${_row[*]} ]]; then
    printf 'Error: %s\n' 'Table insert empty row' >&2
  fi
  local _rowstr=$(printf "$COL_SEP%s" "${_row[@]}")
  _rowstr=$(echo $(printf "%s" "$_rowstr") | column -t -s $"$COL_SEP")
  echo '----------------_UPDATE'
  echo "$dbpath"x

  sedi "s/^$_id.*/$_rowstr/" "$dbpath"
  table_refresh
}
function row_delete () {
  _id=$1
  sedi "s/^$_id/#$_id/" "$dbpath"
  table_refresh
}
function row_select () {
  local _id=$1
  if [[ -z $_id ]]; then
    grep "^ID:" "$dbpath" | column -t
  else
    grep "^$_id" "$dbpath"
  fi
}
