# Set VSCode as the default editor
export EDITOR='code -w'
HISTCONTROL=ignoreboth:erasedups

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

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
