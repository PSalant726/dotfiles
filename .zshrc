# Setup homebrew env
if [[ -d "/opt/homebrew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v brew &> /dev/null; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Make Go binaries globally available
if [[ -d "$HOME/go" ]]; then
  export GOPATH="$(go env GOPATH)"
  export PATH="$GOPATH/bin:$PATH"
  go env -w GOBIN="$GOPATH/bin"
fi

# Info on Volta: https://docs.volta.sh
if [[ -d "$HOME/.volta" ]]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
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
  SOURCE_FILES=($HOME/.rvm/scripts/rvm)
fi

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Info on fzf: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height=10%"
SOURCE_FILES+=($HOME/.fzf.zsh)

# Info on bat: https://github.com/sharkdp/bat
export BAT_THEME="OneHalfDark"

# Info on forgit: https://github.com/wfxr/forgit
export FORGIT_FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=90% --border --preview='bat --color=always {}'"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="spaceship"

if [[ "$ZSH_THEME" = "spaceship" ]]; then
  export SPACESHIP_CONFIG_FILE="$HOME/.spaceship-config.zsh"
  SOURCE_FILES+=($HOME/.spaceship-config.zsh)

elif [[ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" ]]; then
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-tips
  colored-man-pages
  F-Sy-H
  git
  golang
  npm
  yarn
  zsh-autosuggestions

  forgit # must be loaded after git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code -w'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# These `pasteinit` and `pastefinish` functions speed up pasting
# with zsh-autosuggestions enabled
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Config guidelines for eza: https://github.com/eza-community/eza#command-line-options
alias ls='eza --all --classify --color-scale --git --group-directories-first --header --icons --long --no-permissions --no-user --sort=name --time-style=iso'

# Config guidelines for jq colors: https://stedolan.github.io/jq/manual/#Colors
export JQ_COLORS="1;31:0;35:0;35:0;33:0;32:1;37:1;37"

alias main='git checkout main && git pull'
alias master='git checkout master && git pull'
alias bi='bundle install'
alias be='bundle exec'
alias tree='tree --dirsfirst -C'

if [[ -e "$GOPATH/bin/gotest" ]]; then
  export GOTEST_PALETTE="red,higreen"
  alias got='gotest'
fi

# dotfiles manipulation
alias cfg="$HOMEBREW_PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cfga="cfg add"
alias cfgcm="cfg commit -v"
alias cfgca="cfg add -u && cfg commit -v"
alias cfgpl="cfg pull"
alias cfgps="cfg push"
alias cfgs="cfg status"

SOURCE_FILES+=($HOME/.ethyca)

for file in $SOURCE_FILES; do
  [ -r $file ] && [ -f $file ] && source $file;
done;
unset file;
