################
#     Bash     #
################
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa -aahl --git --group-directories-first'
# Change working directories, print new working directory, print long-form contents
cdl() { builtin cd "$@" && builtin pwd && exa -aahl --git --group-directories-first; }

#################
#     Rails     #
#################
alias be='bundle exec'
alias rc="bundle exec rails c"
alias rs="bundle exec rails server -p 3000 --bind 127.0.0.1"

###############
#     Git     #
###############
alias ga='git add'
alias gb='git branch'
alias gca='git commit -v -a'
alias gcb='git checkout -b'
alias gcm='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --graph --decorate'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias master="git checkout master"

###################
#   Movable Ink   #
###################
alias dcjs='deploy_customjs -e production -c'
alias dev='npm run dev'
alias prod='npm run prod'

if [ -f ~/.profile_printer ]; then
  profile_printer() { ~/.profile_printer -company $1 -user $2; }
fi
