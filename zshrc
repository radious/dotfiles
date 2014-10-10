#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

if [ -f ~/.zshrc-local ]; then
source ~/.zshrc-local
fi

autoload -U compinit
compinit -i

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

export EDITOR=emacs

autoload -U colors
colors

autoload -U promptinit
promptinit
prompt off
prompt bart

### from toaster
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd notify

# emacs keybindings
bindkey -e

# Don't put duplicates in history
setopt HIST_IGNORE_DUPS

# Pushd by default
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
#setopt pushdminus

## Word-delete should stop on / char
autoload -U select-word-style
select-word-style bash
