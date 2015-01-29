source_if_exists() {
	if [ -f "$1" ]; then
		. "$1"
	fi
}

clear_screen() {
	# clear the root to deal with bad video drivers leaving shit up
	xsetroot -solid black
}

# clear any caches dmenu has since may be running on new machine
rm .dmenu_cache .cache/dmenu_run > /dev/null 2>&1 &

# lightdm on debian doesn't source ~/.profile
source_if_exists "/etc/profile"
source_if_exists "$HOME/.profile"

if [ -f "$HOME/.Xresources" ]; then
	xrdb "$HOME/.Xresources"
fi

# start urxvt daemon to save memory and speed console start
urxvtd &

clear_screen
xmonad
clear_screen

kill $(jobs -p)
