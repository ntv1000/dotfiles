# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Auto-start tmux
# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# User specific aliases and functions

function is_ssh_fs_path() {
	# TODO handle case if there are multiple sshfs paths
	sshfs_path=$(mount -t fuse.sshfs | sed -e 's/.* on \(.*\) type .*/\1/');
	curr_path=$(pwd);
	if [ -z "$sshfs_path" ]; then
		return 1;
	fi
	if [[ $curr_path == $sshfs_path* ]]; then
		return 0;
	else
		return 1;
	fi
}

function se() {
	SESSION_DIR="$HOME/sessions"

	if [ -z "$1" ]; then
		ls $SESSION_DIR
	else
		MYVIMRC="$HOME/.vimrc" nvim -u $HOME/.vimrc -S $SESSION_DIR/$1.vim
	fi
}

export TERM="screen-256color"

# Use python script for prompt text
export PROMPT_COMMAND='PS1="$(python3 ~/dotfiles/scripts/prompt.py)"'

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# set maximum size for history file
export HISTFILESIZE=-1
export HISTSIZE=-1
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias vim='MYVIMRC="$HOME/.vimrc" nvim -u $HOME/.vimrc'
alias la='ls -la'
alias vimmin="nvim -u NONE"
alias diff="git diff --no-index"
