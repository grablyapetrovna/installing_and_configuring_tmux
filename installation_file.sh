#!/bin/bash

# downloading tmux
apt install tmux

# cloning a repository
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# creating a configuration file
touch ~/.tmux.conf

output_file="~/.tmux.conf"

# write configuration data to a file
cat <<EOL > "$output_file"
set -g default-terminal "screen-256color"

# main prefix
set -g prefix C-a

# sort by name
bind s choose-tree -sZ -O name

# index change
set -g base-index 1
setw -g pane-base-index 1

# remapping keys
unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

set -g mouse on

set-option -g set-clipboard on

set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection

unbind -T copy-mode-vi MouseDragEnd1Pane

# plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/nano-tmux-navigator'
set -g @plugin 'jimeh/tmux-themepack'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-sessionist'

set -g @themepack 'powerline/default/purple'

set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'

# initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
EOL

