#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function test_all () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?

  local FILE= NAME= RV= FAILS=0
  for FILE in *_test.sh; do
    NAME="$(basename -- "$FILE" .sh)"
    NAME="${NAME//_/ }"
    echo "=== $NAME: ==="
    ./"$FILE"
    RV=$?
    [ "$RV" == 0 ] || echo E: "$NAME failed, rv=$RV" >&2
    echo
    [ "$RV" == 0 ] && continue
    (( FAILS += 1 ))
  done

  [ "$FAILS" == 0 ] || return $FAILS$(echo "-ERR $FAILS tests failed." >&2)
  echo "+OK All tests passed."
}


test_all "$@"; exit $?
