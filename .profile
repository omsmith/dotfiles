add_to_path() {
    if [ -d "$1" ] ; then
        PATH="$1:$PATH"
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

# make PATH unique, keeping earliest occurence
PATH=$(echo $PATH | tr ':' '\n' | awk '!x[$0]++' | tr '\n' ':' | sed '$s/.$//')

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

