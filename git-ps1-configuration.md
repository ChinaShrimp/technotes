# Installation
brew install git bash-completion lesspipe

# Configration
## git
```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.st status
git config --global apply.whitespace nowarn
```

Paste following to ~/.gitconfig file
```
[color]
    branch = auto
    diff = auto
    status = auto
[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
[color "status"]
    added = yellow
    changed = green
    untracked = cyan
```

For OSX users, paste following into ~/.bash_profile:
```
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

#shell prompt example
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$'
```

## ~/.bashrc
```
# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```


# Reference
[Creating a Happy Git Environment on OS](https://gist.github.com/trey/2722934)
[OSX git PS1 command not Found](http://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found)
