# Setup homebrew env
if [[ -d "/opt/homebrew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_ENV_HINTS=1
fi

# Make Go binaries globally available
if [[ -d "$HOME/go" ]]; then
  export GOPATH="$(go env GOPATH)"
  export PATH="$GOPATH/bin:$PATH"
  go env -w GOBIN="$GOPATH/bin"
fi

# Initialize fnm: https://github.com/Schniz/fnm
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# Initialize pyenv
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"

  # Initialize pyenv-virtualenv
  if command -v pyenv-virtualenv-init &> /dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# Initialize rvm
if [[ -d "$HOME/.rvm" ]]; then
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  SOURCE_FILES=("$HOME/.rvm/scripts/rvm")
fi

# Initialize mysql
if [[ -d "$(brew --prefix mysql-client)/bin" ]]; then
  export PATH="$(brew --prefix mysql-client)/bin:$PATH"
fi

# Info on fzf: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height=10%"
SOURCE_FILES+=("$HOME/.fzf.zsh")

# Info on bat: https://github.com/sharkdp/bat
export BAT_THEME="OneHalfDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Info on forgit: https://github.com/wfxr/forgit
export FORGIT_FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=90% --border --preview='bat --color=always {}'"
export FORGIT_NO_ALIASES=1

# Info on starship: https://starship.rs
if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG=$HOME/starship.toml
  eval "$(starship init zsh)"

  # Store the original starship prompt
  _ORIG_PROMPT=$PROMPT
  _ORIG_RPROMPT=$RPROMPT

  # Transient prompt
  function accept-line-with-transient() {
    # Set transient prompt for the current line
    PROMPT="$(starship module character)"
    RPROMPT=''
    zle reset-prompt
    zle .accept-line

    # Restore full prompt for next command
    PROMPT=$_ORIG_PROMPT
    RPROMPT=$_ORIG_RPROMPT
  }

  zle -N accept-line accept-line-with-transient
fi

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify share_history

# Shell options
setopt auto_cd auto_pushd pushd_ignore_dups pushdminus
setopt interactive_comments long_list_jobs multios
setopt always_to_end auto_menu complete_in_word
unsetopt flowcontrol menu_complete

# Completion
fpath+=~/.zfunc
fpath=(
    "$HOMEBREW_PREFIX/share/zsh/functions"
    "$HOME/.docker/completions"
    $fpath
)

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Key bindings
bindkey -e

autoload -U up-line-or-beginning-search down-line-or-beginning-search edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[H' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^X^E' edit-command-line

autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# Plugins
[[ -r "$HOMEBREW_PREFIX/opt/forgit/share/forgit/forgit.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/opt/forgit/share/forgit/forgit.plugin.zsh"
[[ -r "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# Generate Zed completions
eval "$(zed --completions zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='zed --wait'
fi

export CLAUDE_CONFIG_DIR=$HOME/.claude-personal

# Config guidelines for eza: https://github.com/eza-community/eza#command-line-options
alias ls='eza --all --classify --color-scale --git --group-directories-first --header --icons --long --no-permissions --no-user --sort=name --time-style=iso'

# Config guidelines for jq colors: https://stedolan.github.io/jq/manual/#Colors
export JQ_COLORS="1;31:0;35:0;35:0;33:0;32:1;37:1;37"

alias main='git checkout main && git pull'
alias master='git checkout master && git pull'
alias tree='tree --dirsfirst -C'

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
  export GOTEST_PALETTE="red,higreen"
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
alias ga='forgit::add'
alias gd='forgit::diff'
alias glo='forgit::log'
alias gcb='forgit::checkout::branch'

# Psychology Today
SOURCE_FILES+=("$HOME/.psychology-today.zsh")

# Mercury Business Banking CLI
SOURCE_FILES+=("$HOME/.config/mercury-cli/env.sh")

for file in "${SOURCE_FILES[@]}"; do
    # shellcheck source=/dev/null
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Must be sourced last
[[ -r "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
