#!/bin/bash

bash ./keys_remapping.sh

tmux new -d -s emacs 'emacs25'

tmux new -d -s main
tmux split-window -v
tmux split-window -h
tmux select-pane -t 0

# setting up spotify and weather
tmux split-window -h 'while true; do curl -s wttr.in; sleep 60; clear; done'
# tmux split-window -v 'watch -ct -n 0.2 spotify status'

tmux select-pane -t 2
tmux resize-pane -U 10

tmux select-pane -t 0
tmux -2 attach-session -d
