#!/bin/sh
set -e
. ./export_ccompiler.sh
. ./headers.sh

for PROJECT in $PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE install)
done
