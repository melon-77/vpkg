#!/bin/sh
# a package added or removed GSettings schemas: recompile gschemas.compiled
[ -d /usr/share/glib-2.0/schemas ] || exit 0
exec /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
