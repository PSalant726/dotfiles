# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Info on fzf: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height=10%"

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
  bundler
  colored-man-pages
  fast-syntax-highlighting
  git
  go
  jsontools
  npm
  urltools
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

# dotfiles manipulation
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfga="cfg add"
alias cfgcm="cfg commit -v"
alias cfgpl="cfg pull"
alias cfgps="cfg push"
alias cfgs="cfg status"

# Movable Ink
alias dcjs='deploy_customjs -e production -c'
alias mirepos='cd ~/Documents/MovableInk/'
alias provisioning='cd ~/Documents/MovableInk/provisioning && git checkout master && git pull origin master && bundle install'
export GOPRIVATE=github.com/movableink
platform_start() {
  # Node v10.* is required
  nvm use 10

  # Update Canvas and the relevant packages
  cd ~/Documents/MovableInk/canvas/
  git checkout master
  git pull origin master
  yarn install

  cd ./packages/canvas/
  git checkout master
  git pull origin master
  yarn install

  cd ../kings-cross/
  git checkout master
  git pull origin master
  yarn install

  # Update Ojos
  cd ~/Documents/MovableInk/ojos
  git checkout master
  git pull origin master
  yarn install
  bundle install

  # Update rails
  cd ~/Documents/MovableInk/movableink
  git checkout master
  git pull origin master
  bundle install

  # Start it all up!
  forego start
}

for file in ~/.{p10k.zsh,spaceship-config.zsh,credentials,fzf.zsh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
