#!/usr/bin/sh

# killing running bars
polybar-msg cmd quit

# launch polybar [location ~/.config/polybar/config]
#polybar main & disown
#polybar tray & disown
polybar -r &

