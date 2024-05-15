#!/usr/bin/env bash

# "nvim session strategy"
#
# Same as vim strategy, see file 'vim_session.sh'
#
# Adapted to work with hidden session files named after Tmux pane IDs


ORIGINAL_COMMAND="$1"
DIRECTORY="$2"

# Fetch current Tmux session, window, and pane identifiers
get_tmux_identifiers() {
    local session_id_raw=$(tmux display-message -p "#{session_id}")
    # Remove the dollar sign from the session ID
    local session_id=${session_id_raw#\$}
    local window_index=$(tmux display-message -p "#{window_index}")
    local pane_index=$(tmux display-message -p "#{pane_index}")
    echo "${session_id}-${window_index}-${pane_index}"
}

# Check if a specific Neovim session file exists
nvim_session_file_exists_for_identifiers() {
    local identifiers=$(get_tmux_identifiers)
    [ -e "${DIRECTORY}/.TmuxNvimSession-${identifiers}.vim" ]
}

nvim_session_file_exists() {
	[ -e "${DIRECTORY}/Session.vim" ]
}

original_command_contains_session_flag() {
	[[ "$ORIGINAL_COMMAND" =~ "-S" ]]
}

main() {
	if nvim_session_file_exists_for_identifiers; then
		local identifiers=$(get_tmux_identifiers)
		echo "nvim -S ${DIRECTORY}/.TmuxNvimSession-${identifiers}.vim"
	elif nvim_session_file_exists; then
		echo "nvim -S"
	elif original_command_contains_session_flag; then
		# Session file does not exist, yet the original nvim command contains
		# session flag `-S`. This will cause an error, so we're falling back to
		# starting plain nvim.
		echo "nvim"
	else
		echo "$ORIGINAL_COMMAND"
	fi
}
main