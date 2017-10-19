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

# my screen is broken
fixscreen

# start redshift in the background
redshift -t 6500K:3700K &

# start urxvt daemon to save memory and speed console start
urxvtd -q -f -o

clear_screen
xmonad
clear_screen

# kill background jobs
jobs -p | xargs kill
