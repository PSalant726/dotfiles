# Set VSCode as the default editor
export EDITOR='code -w'

# Load shell dotfiles
for file in ~/.{bash_prompt,bash_aliases,credentials,git-completion}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Git branch bash completion
if [ -f ~/.git-completion.sh ]; then
  . ~/.git-completion.sh

  # Add git completion to aliases
  __git_complete gco _git_checkout
  __git_complete gb _git_branch
fi

# Exercism bash completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

# Load RVM into a shell session *as a function*
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

# Initialize RBENV
eval "$(rbenv init -)"

# Load NVM
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
