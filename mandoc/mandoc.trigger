#!/bin/sh
# a package added or removed manual pages: rebuild the index (man looks in it first; man -k and apropos search it)
[ -d /usr/share/man ] && /usr/bin/makewhatis /usr/share/man 2>/dev/null
exit 0
