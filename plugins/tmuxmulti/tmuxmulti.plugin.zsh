#!/bin/bash
# ssh-multi
# D.Kovalov
# Based on http://linuxpixies.blogspot.jp/2011/06/tmux-copy-mode-and-how-to-control.html

# a script to ssh multiple servers over multiple tmux panes


tmuxmulti() {
    if [ -z "$HOSTS" ]; then
       echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
       read HOSTS
    fi

    local -a hosts;
    hosts=( $HOSTS )


    tmux new-window "ssh ${hosts[0]}"
    unset hosts[0];
    #for i in "${hosts[@]}"; do
    for i in $HOSTS; do
        tmux split-window -h  "ssh $i"
        tmux select-layout tiled > /dev/null
    done
    tmux select-pane -t 0
    tmux set-window-option synchronize-panes on > /dev/null

}

