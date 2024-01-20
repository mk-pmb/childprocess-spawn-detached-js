#!/bin/sh
[ -z "$TEST_DUMP_FILE" ] || exec >>"$TEST_DUMP_FILE" || exit $?
printf -- '‹%s› ' "$@"; echo "n=$#"
