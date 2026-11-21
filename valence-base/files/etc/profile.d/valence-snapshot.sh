# Said at login when this is not the system that starts by default: a boot menu entry under "Valence snapshots"
# started it, as a copy of that snapshot, for this session (valence-snapshot, /usr/libexec/valence/boot-snapshot).
if [ -r /run/valence/trial ]; then
  printf '\n  This is the system as it was in snapshot %s, started from the boot menu.\n' "$(cat /run/valence/trial)"
  printf '  To keep it:      sudo valence-snapshot rollback   (it becomes what starts by default)\n'
  printf '  To leave it be:  restart, and the default system starts again, unchanged.\n\n'
fi
