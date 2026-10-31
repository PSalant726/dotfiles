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
fi

# Initialize mysql
if [[ -d "$HOMEBREW_PREFIX/opt/mysql-client/bin" ]]; then
  export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"
fi

export EDITOR='zed --wait'
export CLAUDE_CONFIG_DIR=$HOME/.claude-personal

# Info on fzf: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height=10%"

# Info on bat: https://github.com/sharkdp/bat
export BAT_THEME="OneHalfDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Info on forgit: https://github.com/wfxr/forgit
export FORGIT_FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=90% --border --preview='bat --color=always {}'"
export FORGIT_NO_ALIASES=1

# Info on starship: https://starship.rs
export STARSHIP_CONFIG=$HOME/starship.toml

# Config guidelines for jq colors: https://stedolan.github.io/jq/manual/#Colors
export JQ_COLORS="1;31:0;35:0;35:0;33:0;32:1;37:1;37"

export GOTEST_PALETTE="red,higreen"

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/philsalant/.docker/bin"
# End of Docker Desktop section.

