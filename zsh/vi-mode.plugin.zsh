# Ensures that $terminfo values are valid and updates editor information when
# the keymap changes.
function zle-keymap-select zle-line-init zle-line-finish {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey -v

# if mode indicator wasn't setup by theme, define default
if [[ "$NORMAL_INDICATOR" == "" ]]; then
  NORMAL_INDICATOR="%{$fg[green]%}⮂%{$fg[black]$bg[green]%} NORMAL %{$reset_color%}"
fi

if [[ "$INSERT_INDICATOR" == "" ]]; then
  INSERT_INDICATOR="%{$fg[white]%}⮂%{$fg[black]$bg[white]%} INSERT %{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$NORMAL_INDICATOR}/(main|viins)/$INSERT_INDICATOR}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi

zle -N edit-command-line

bindkey -M vicmd v edit-command-line

# Make sure Ctrl-R works
bindkey '^R' history-incremental-search-backward

# Make backspace work like vim
bindkey '^?' backward-delete-char
KEYTIMEOUT=1
# When using arrows, match what I have already typed
# for history search
bindkey -M viins "\e[A" history-beginning-search-backward # Up arrow
bindkey -M viins "\e[B" history-beginning-search-forward  # Down arrow
bindkey -M vicmd "k"    up-line-or-search
bindkey -M vicmd "j"    up-line-or-search
bindkey -M viins "\e[Z" reverse-menu-complete
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey '\e[1~' beginning-of-line
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '\177' backward-delete-char
bindkey '\e[2~' overwrite-mode

bindkey "\e[7~" beginning-of-line
bindkey "\e[H" beginning-of-line
#bindkey "\e[2~" transpose-words
bindkey "\e[8~" end-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line

