# Initialize fnm: https://github.com/Schniz/fnm
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# Info on starship: https://starship.rs
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"

  # Store the original starship prompt
  _ORIG_PROMPT=$PROMPT

  # Exit status of the last command, for the transient prompt
  _transient_status=0
  function _transient_save_status() { _transient_status=$? }
  precmd_functions=(_transient_save_status $precmd_functions)

  # Transient prompt
  function accept-line-with-transient() {
    # Set transient prompt for the current line
    if (( _transient_status )); then
      PROMPT='%B%F{red}❯%f%b '
    else
      PROMPT='%B%F{green}❯%f%b '
    fi

    zle reset-prompt
    zle .accept-line

    # Restore full prompt for next command
    PROMPT=$_ORIG_PROMPT
  }

  zle -N accept-line accept-line-with-transient
fi

# History
HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify share_history

setopt auto_cd auto_pushd pushd_ignore_dups pushdminus # Directories
setopt interactive_comments long_list_jobs             # Shell options
setopt always_to_end complete_in_word                  # Completion

typeset -U fpath
fpath=("$HOME/.config/zsh/functions" "$HOME/.docker/completions" $fpath)

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Key bindings
bindkey -e
unsetopt flowcontrol

autoload -U up-line-or-beginning-search down-line-or-beginning-search edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey '^X^E' edit-command-line

autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# Plugins
[[ -r "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh" ]] && source "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
[[ -r "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# Config guidelines for eza: https://github.com/eza-community/eza#command-line-options
alias ls='eza --all --classify --color-scale --git --group-directories-first --header --icons --ignore-glob=.DS_Store --long --no-permissions --no-user --sort=name --time-style=iso'

alias main='git checkout main && git pull'
alias master='git checkout master && git pull'
alias tree='tree --dirsfirst -C'
alias gmailctl='gmailctl --config "$HOME/.config/gmailctl"'

# git
alias gb='git branch'
alias gbs='git bisect'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gco='git checkout'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias grst='git restore --staged'
alias gst='git status'

# go
alias gog='go get'
alias gomt='go mod tidy'

if [[ -e "$GOPATH/bin/gotest" ]]; then
  alias got='gotest'
fi

# dotfiles manipulation
alias cfg='$HOMEBREW_PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfga="cfg add"
alias cfgcm="cfg commit -v"
alias cfgca="cfg add -u && cfg commit -v"
alias cfgpl="cfg pull"
alias cfgps="cfg push"
alias cfgs="cfg status"

# replace some git aliases with forgit
alias ga='git-forgit add'
alias gd='git-forgit diff'
alias glo='git-forgit log'
alias gcb='git-forgit checkout_branch'

# Info on fzf: https://github.com/junegunn/fzf
source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"

# Machine-local config, not tracked in dotfiles
for file in "$HOME"/.config/zsh/local/*.zsh(N-.); do source "$file"; done
unset file

# Must be sourced last
[[ -r "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
