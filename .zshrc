# Make Go binaries globally available
if [[ -d "$HOME/go" ]]; then
  export GOPATH="$(go env GOPATH)"
  go env -w GOBIN="$GOPATH/bin"
  export PATH="$GOPATH/bin:$PATH"
fi

# Info on Volta: https://docs.volta.sh
if [[ -d "$HOME/.volta" ]]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Initialize pyenv
if [[ -d "$HOME/.pyenv" ]]; then
  eval "$(pyenv init -)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Info on fzf: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height=10%"
SOURCE_FILES=($HOME/.fzf.zsh)

# Info on bat: https://github.com/sharkdp/bat
export BAT_THEME="OneHalfDark"

# Info on forgit: https://github.com/wfxr/forgit
export FORGIT_FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=50% --border --preview='bat --color=always {}'"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="spaceship"

if [[ "$ZSH_THEME" = "spaceship" ]]; then
  export SPACESHIP_PROMPT_DEFAULT_PREFIX="& " # Must be defined before spaceship is sourced
  SOURCE_FILES+=($HOME/.spaceship-config.zsh)

elif [[ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" ]]; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block, everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  SOURCE_FILES+=($HOME/.p10k.zsh)
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
# DISABLE_UPDATE_PROMPT="true"

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
  fast-syntax-highlighting
  git
  gitfast
  golang
  npm
  yarn

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

# Config guidelines for exa: https://the.exa.website/docs/colour-themes
export EXA_COLORS="da=33:di=1;36:un=31:uu=34"
alias ls='exa -ahlF --color-scale --git --group-directories-first'

alias master='git checkout master && git pull'
alias bi='bundle install'
alias be='bundle exec'

if [[ -e "$GOPATH/bin/gotest" ]]; then
  export GOTEST_PALETTE="red,higreen"
  alias got='gotest'
fi

# dotfiles manipulation
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfga="cfg add"
alias cfgcm="cfg commit -v"
alias cfgca="cfg add -u && cfg commit -v"
alias cfgpl="cfg pull"
alias cfgps="cfg push"
alias cfgs="cfg status"

SOURCE_FILES+=($HOME/.movable-ink)

for file in $SOURCE_FILES; do
  [ -r $file ] && [ -f $file ] && source $file;
done;
unset file;
