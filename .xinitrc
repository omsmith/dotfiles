export HOMEDIR=/users/omsmith
export PATH=$HOMEDIR/bin:$HOMEDIR/.cabal/bin:$PATH
rm .dmenu_cache .cache/dmenu_run > /dev/null 2>&1 &
xmonad
