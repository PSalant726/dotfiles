###################################
###   Prompt order and symbol   ###
###################################

export SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  line_sep      # Line break
  battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exec_time     # Execution time
  # exit_code     # Exit code section
  char          # Prompt character
)

export SPACESHIP_RPROMPT_ORDER=(
  package       # Package version
  conda         # conda virtualenv section
  node          # Node.js section
  ruby          # Ruby section
  # elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  aws           # Amazon Web Services section
  pyenv         # Pyenv section
  venv          # virtualenv section
  # dotnet        # .NET section
  ember         # Ember.js section
  docker        # Docker section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
)

export SPACESHIP_CHAR_SYMBOL="$"
export SPACESHIP_CHAR_SUFFIX=" "

###################################
###            Time             ###
###################################

export SPACESHIP_TIME_SHOW=false
export SPACESHIP_TIME_12HR=true

###################################
###         User & Host         ###
###################################

export SPACESHIP_USER_SHOW=true
export SPACESHIP_USER_COLOR=green
export SPACESHIP_USER_SUFFIX=""

export SPACESHIP_HOST_SHOW=true
export SPACESHIP_HOST_COLOR=green
export SPACESHIP_HOST_COLOR_SSH=red
export SPACESHIP_HOST_PREFIX="@"

###################################
###          Directory          ###
###################################

export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_DIR_COLOR=160
export SPACESHIP_DIR_LOCK_COLOR=165

###################################
###             Git             ###
###################################

export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_GIT_BRANCH_COLOR=166

export SPACESHIP_GIT_STATUS_COLOR=yellow

###################################
###           Battery           ###
###################################

export SPACESHIP_BATTERY_THRESHOLD=20

###################################
###       Execution Time        ###
###################################

export SPACESHIP_EXEC_TIME_PREFIX="Took "
export SPACESHIP_EXEC_TIME_ELAPSED=5

###################################
###      Docker/Kubernetes      ###
###################################

export SPACESHIP_KUBECONTEXT_SHOW=false
