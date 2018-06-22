#!/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/helpers.zsh

loopDir $DIR/script source
loopDir $DIR/theme source
sourceDir $DIR/plugins source zsh

