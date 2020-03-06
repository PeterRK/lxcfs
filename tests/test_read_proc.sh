#/bin/sh
# SPDX-License-Identifier: LGPL-2.1+

set -eu
[ -n "${DEBUG:-}" ] && set -x

DIR=${LXCFSDIR:-/var/lib/lxcfs}

if ! mountpoint -q $DIR; then
    echo "lxcfs isn't mounted on ${DIR}"
    exit 1
fi

echo "==> Testing /proc/cpuinfo"
tests/test-read $DIR/proc/cpuinfo 3 >/dev/null

echo "==> Testing /proc/stat"
tests/test-read $DIR/proc/stat 3 >/dev/null

echo "==> Testing /proc/meminfo"
tests/test-read $DIR/proc/meminfo 3 >/dev/null

exit 0
