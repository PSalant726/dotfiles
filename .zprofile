# Setup homebrew env
if [[ -d "/opt/homebrew" ]]; then
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_XDG_CONFIG_HOME="$HOME/.config"

  _brew_env="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/brew-shellenv.zsh"
  [[ "$_brew_env" -nt /opt/homebrew/Library/Homebrew/cmd/shellenv.sh ]] || { mkdir -p "${_brew_env:h}"; /opt/homebrew/bin/brew shellenv > "$_brew_env"; }
  source "$_brew_env"
  unset _brew_env
fi

# Make Go binaries globally available
if [[ -d "$HOME/go" ]]; then
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
fi

export EDITOR='zed --wait'
export CLAUDE_CONFIG_DIR=$HOME/.config/claude-code
export npm_config_cache="$HOME/.cache/npm"

export LS_COLORS='di=1;31:ln=36:pi=35:so=33:bd=1;33:cd=1;33:ex=1;32'
export EZA_COLORS='reset'

# Info on bat: https://github.com/sharkdp/bat
export BAT_THEME="OneHalfDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Info on forgit: https://github.com/wfxr/forgit
export FORGIT_FZF_DEFAULT_OPTS="--border --height=95% --layout=reverse --preview='bat --color=always {}'"

# Info on starship: https://starship.rs
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Config guidelines for jq colors: https://stedolan.github.io/jq/manual/#Colors
export JQ_COLORS="1;31:0;35:0;35:0;33:0;32:1;37:1;37"

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/philsalant/.docker/bin"
# End of Docker Desktop section.
