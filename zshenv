export PATH=~/bin:~/.alias:$PATH
export EDITOR=emacs
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

if [ -f ~/.zshenv-local ]; then
    source ~/.zshenv-local
fi
