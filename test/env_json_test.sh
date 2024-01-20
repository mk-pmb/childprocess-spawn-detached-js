#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function env_json_test () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?

  local TEST_BFN="$FUNCNAME"
  local TEST_DUMP_FILE="tmp.$TEST_BFN.txt"
  export TEST_DUMP_FILE
  >"$TEST_DUMP_FILE" || return $?$(echo E: "Cannot clear $TEST_DUMP_FILE" >&2)

  test_env_json '["./write_to_file.sh",
    ["args array:", "1   1", "2   2", "3   3"]
    ]' || return $?

  test_env_json '["./write_to_file.sh", []]' || return $?

  args_json='[]' node "$TEST_BFN".js || return $?
  args_json='[false]' node "$TEST_BFN".js || return $?
  args_json='[null]' node "$TEST_BFN".js || return $?
  args_json='[""]' node "$TEST_BFN".js || return $?

  test_env_json '["./write_to_file.sh shell test"]' || return $?

  test_env_json '["./write_to_file.sh"]' || return $?
  test_env_json '["./write_to_file.sh", false]' || return $?

  diff -sU 2 -- "$TEST_BFN".want.txt "$TEST_DUMP_FILE" || return $?
  rm -- "$TEST_DUMP_FILE" || return $?$(echo E: "Cannot rm $TEST_DUMP_FILE" >&2)
}


function test_env_json () {
  args_json="$1" node "$TEST_BFN".js || return $?
  sleep 0.5s || return $?
}








env_json_test "$@"; exit $?
