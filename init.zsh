#!/bin/zsh

DIR="$HOME/.zsh/plugins/zsh_custom_conf"
source $DIR/helpers.zsh

loopDir $DIR/script source
loopDir $DIR/theme source
sourceDir $DIR/plugins source zsh

