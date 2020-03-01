#!/usr/bin/env bats

load table

setup() {
  rm -rf /tmp/bash_table.db || true
  local _columns=( "FirstName"  "LastName" "Age" )
  table_init "/tmp/bash_table.db" "${_columns[@]}"
}

teardown() {
  rm -rf /tmp/bash_table.db || true
}

@test "lib/table/table.bash get_md5" {
  [ "$(get_md5 123)" = "ba1f2511fc30423bdbb183fe33f3dd0f" ]
}

@test "lib/table/table.bash table_init" {
  [ "$(cat /tmp/bash_table.db)" = "$(cat ./lib/table/fixtures/table_init.db)" ]
}

@test "lib/table/table.bash row_insert" {

  _row=( 'Jim'  'Green' '20' )
  _id=$(row_insert ${_row[@]})
  echo "Insert ID: $_id"
  
  expect="$(cat ./lib/table/fixtures/row_insert.db | sed s/_____________/$_id/)"

  echo $expect

  [ "$(cat /tmp/bash_table.db)" = "$expect" ]
}

@test "lib/table/table.bash row_length" {

  _len=$(row_length)

  [ "$_len" = "0" ];

  _row=( 'Jim'  'Green' '20' )
  _id=$(row_insert ${_row[@]})

  _len=$(row_length)

  [ "$_len" = "1" ];
}

@test "lib/table/table.bash row_update" {

  local _row=( 'Jim'  'White' '21' )
  local _id=$(row_insert ${_row[@]})
  local _newrow=( 'Han' 'Meimei' '18' )
  row_update "$_id" "${_newrow[@]}"

  expect="$(cat ./lib/table/fixtures/row_update.db | sed s/_____________/$_id/)"

  [ "$(cat /tmp/bash_table.db)" = "$expect" ]
}


@test "lib/table/table.bash row_delete" {

  _row=( 'Jim'  'White' '21' )
  _id=$(row_insert ${_row[@]})
  row_delete $_id

  expect="$(cat ./lib/table/fixtures/row_delete.db | sed s/_____________/$_id/)"

  [ "$(cat /tmp/bash_table.db)" = "$expect" ]
}

@test "lib/table/table.bash row_select" {

  local _row=( "Jay-Simth"  "White" "92" )
  local _id=$(row_insert "${_row[@]}")
  local _newrow
  row_select
  read -r -a _newrow <<< $(row_select "$_id")
  actual=$(echo ${_newrow[@]} | column -t)
  expect="$(cat ./lib/table/fixtures/row_select.db | sed s/_____________/$_id/)"

  echo "actual: $actual"
  echo "expect: $expect"

  [ "$actual" = "$expect" ]
}
