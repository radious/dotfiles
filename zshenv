# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# path
export PATH=~/bin:~/.alias:$PATH
export ALTERNATE_EDITOR=''
export EDITOR=vim
export PAGER=less

## Go
GODIR=~/Programming/go
if [[ -d $GODIR ]]; then
    GOBIN=$GODIR/bin
    if [[ -d $GOBIN ]]; then
        export PATH=$PATH:$GOBIN
    fi
    if [[ -z "$GOPATH" ]]; then
        export GOPATH=$GODIR
    fi
fi


LOCALGO=~/local/go
if [[ -d $LOCALGO ]]; then
    GOBIN=$LOCALGO/bin
    if [[ -d $GOBIN ]]; then
        export PATH=$PATH:$GOBIN
    fi
    export GOPATH=$LOCALGO:$GOPATH
fi

if [ -f ~/.zshenv-local ]; then
    source ~/.zshenv-local
fi
