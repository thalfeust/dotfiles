#!/bin/bash

# Get the current flavour
current_flavour=$(tmux show-option -gqv @catppuccin_flavour)

# Toggle the flavour
if [ "$current_flavour" = "frappe" ]; then
  tmux set -g @catppuccin_flavour 'latte'
else
  tmux set -g @catppuccin_flavour 'frappe'
fi