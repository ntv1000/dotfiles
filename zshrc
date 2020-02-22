###############
# Environment #
###############

# Auto-start tmux
# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Extend PATH
export PATH=$PATH:$HOME/.local/bin/

# Set default editor
# https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
export EDITOR=nvim
export VISUAL=nvim

# Default options for fzf
#export FZF_DEFAULT_OPTS="--bind=alt-j:down,alt-k:up"


#######################
# Shell configuration #
#######################

autoload -U colors && colors
autoload -Uz promptinit && promptinit

KEYTIMEOUT=1
setopt PROMPT_SUBST
setopt MENU_COMPLETE
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Prompt
precmd() {
	PROMPT="$(python3 ~/dotfiles/scripts/prompt.py)"
}

# Widgets
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
      (vicmd)      VIM_PROMPT="%{$fg_bold[yellow]%} [NORMAL]%{$reset_color%}" ;;
      (main|viins) VIM_PROMPT="" ;;
      (*)          VIM_PROMPT="" ;;
    esac
    RPS1="$VIM_PROMPT $EPS1"
    zle reset-prompt
}

function fzf-history {
    zle kill-whole-line
    BUFFER=" fh"
    zle accept-line
}

function my-popd {
    zle kill-whole-line
    BUFFER="popd -q"
    zle accept-line
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N fzf-history
zle -N my-popd

# Completion
# TODO What of this stuff is really necessary?
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/christian/.zshrc'

autoload -Uz compinit
compinit
zmodload zsh/complist

# Keybindings
bindkey -v
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey '^r' fzf-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^b' my-popd
bindkey -s '^[k' ''
bindkey -s '^[j' ''
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '^M' .accept-line
bindkey '^[[[CE' autosuggest-execute

# Command history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt BANG_HIST

# Plugins
source ~/.zsh/zsh-bd/bd.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


###########
# Aliases #
###########

alias vim='MYVIMRC="$HOME/.vimrc" nvim -u $HOME/.vimrc'
alias ls='lsd --date relative --group-dirs first -1'
alias ll='ls -l'
alias la='ls -lA'
alias vimmin="nvim -u NONE"
alias diff="git diff --no-index"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


#############
# Functions #
#############

# Replace the name and the email of a Git author.
function git-replace-author {
    if [ $# -ne 3 ]; then
        echo "Usage: $0 <email_old> <name_new> <email_new>" >&2
        return 1
    fi

    local email_old="$1"
    local name_new="$2"
    local email_new="$3"

    git filter-branch --env-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "'$email_old'" ]; then
            GIT_AUTHOR_NAME="'$name_new'";
            GIT_AUTHOR_EMAIL="'$email_new'";
            GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME";
            GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
        fi' -- --all
}

function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# repeat history edit
function fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height 12 | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}






#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' use-simple true
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' check-for-staged-changes true
#zstyle ':vcs_info:*' stagedstr "%F{150}●%f"
#zstyle ':vcs_info:*' unstagedstr "%F{222}●%f"
#zstyle ':vcs_info:git+set-message:*' hooks git-untracked
#zstyle ':vcs_info:git*' formats "[%b %F{150}✔%f%c%u]"
#zstyle ':vcs_info:git*' actionformats "[%b %F{167}✘%f%c%u]"

#PROMPT='%n@%m:%~%(?..%F{167})$%f '
#RPROMPT="\${vcs_info_msg_0_}"

# vcs_info called before prompt is drawn.
#add-zsh-hook precmd vcs_info
