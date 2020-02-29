#!/usr/bin/env bats

load util

@test "lib/util.sh exists" {
  run exists cd_not_exist_command
  [ "$status" -eq 1 ]

  run exists ls
  [ "$status" -eq 0 ]
}


@test "lib/util.sh numberin" {
  rst="$(numberin 1 1 10)"
  [ "$rst" == "true" ]

  rst="$(numberin 1 2 10)"
  [ "$rst" == "false" ]

  rst="$(numberin 5 2 5)"
  [ "$rst" == "true" ]

  rst="$(numberin xyz 2 5)"
  [ "$rst" == "false" ]
}

