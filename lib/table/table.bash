#!/bin/bash

# Author   : Gcaufy
# Date     : 2020/02/16

dbpath=""
COL_SEP="[}"

function table_refresh () {
  cat "$dbpath" | grep "^#ID:" | cat > "$dbpath.tmp.deleted"
  cat "$dbpath" | grep "^#" | grep -v "^#ID:" | cat > "$dbpath.tmp.comment"
  cat "$dbpath" | grep -v "^#" | cat | column -t > "$dbpath.tmp.db"
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
    if ! [[ -z $_columns ]]; then
      echo "ID"$(printf "$COL_SEP%s" "${_columns[@]}") | column -t -s $"$COL_SEP" > $dbpath
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
  if [[ -z $_row ]]; then
    printf 'Error: %s\n' 'Table insert empty row' >&2
  fi
  local _rowstr=$(printf "$COL_SEP%s" "${_row[@]}")
  local _tid="ID:"$(md5 -q -s "$_rowstr$RANDOM" | cut -c1-10)

  echo $(printf "%s$COL_SEP%s" "$_tid" "$_rowstr") | column -t -s $"$COL_SEP" >> $dbpath
  table_refresh
  echo $_tid
}

function row_update () {
  local _row=( "$@" )
  local _id=${_row[0]}

  if [[ -z $_row ]]; then
    printf 'Error: %s\n' 'Table insert empty row' >&2
  fi
  local _rowstr=$(printf "$COL_SEP%s" "${_row[@]}")
  _rowstr=$(echo $(printf "%s" $_rowstr) | column -t -s $"$COL_SEP")
  sed -i '' "s/^$_id.*/$_rowstr/" $dbpath
  table_refresh
}
function row_delete () {
  _id=$1
  sed -i '' "s/^$_id/#$_id/" "$dbpath"
  table_refresh
}
function row_select () {
  local _id=$1
  if [[ -z $_id ]]; then
    cat $dbpath | grep "^ID:" | column -t
  else
    cat $dbpath | grep "^$_id"
  fi
}
function test_row_insert () {
  echo "======TEST: test row insert"
  _row=( 'Jim'  'Green' '20' )
  _id=$(row_insert ${_row[@]})
  echo "Insert ID: $_id"
}
function test_row_delete () {
  echo "======TEST: test row delete"
  _row=( 'Jim'  'White' '21' )
  _id=$(row_insert ${_row[@]})
  row_delete $_id
}
function test_row_update () {
  echo "======TEST: test row update"
  local _row=( 'Jim'  'White' '21' )
  local _id=$(row_insert ${_row[@]})
  local _newrow=( 'Han' 'Meimei' '18' )
  row_update "$_id" "${_newrow[@]}"
}
function test_row_select () {
  echo "======TEST: test row select"
  local _row=( "Jay-Simth"  "White" "92" )
  local _id=$(row_insert "${_row[@]}")
  local _newrow
  row_select
  read -r -a _newrow <<< $(row_select "$_id")
  echo ${_newrow[@]} | column -t
}
function test_table_init () {
  echo "======TEST: test table init"
  local _columns=( "FirstName"  "LastName" "Age" )
  rm /tmp/bash_table.db
  table_init "/tmp/bash_table.db" "${_columns[@]}"
}
#
# test_table_init
# test_row_insert
# test_row_update
# test_row_delete
# test_row_select
# echo "======TEST: DONE"
# cat /tmp/bash_table.db | column -t
