# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# include PS1
if [ -f ~/.bash_ps1 ]; then
	. ~/.bash_ps1
fi

# l2man
function command_not_found_handle {
    if [ `expr length $1` -gt "2" ]; then
        if [ "${1:0:2}" = "l2" ]; then
            man -- "${1:2}"
            return 0
        fi
    fi

    if  [ -x /usr/lib/command-not-found ]; then
        /usr/lib/command-not-found -- "$1"
        return $?
    fi

    return 127
}

function print-path() {
	echo $PATH | tr ":" "\n"
}

# some environment variables
EDITOR=vim

# aliases
alias dotgit="git --work-tree=$HOME --git-dir=$HOME/dev/dotfiles.git"
#alias play="mplayer -cache 25000 -cache-min 99 -af volnorm=2 -vf pp=ac/fd"
alias play="mplayer -cache 25000 -cache-min 99 -vf pp=ac/fd"

printf "\033?\033=" >/dev/tty

