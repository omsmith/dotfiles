# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

add_to_path() {
    if [ -d "$1" ] ; then
        export PATH="$1:$PATH"
    fi
}

# ~/.gem/ruby/1.8/bin
add_to_path "$HOME/.gem/ruby/1.8/bin"

# ~/node_modules/.bin
add_to_path "$HOME/node_modules/.bin"

# ~/.cabal/bin
add_to_path "$HOME/.cabal/bin"

# ~/bin
add_to_path "$HOME/bin"

unset add_to_path

