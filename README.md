# `dotfiles` Management with a Bare Git Repository
## Prerequisite
Prior to installation, make sure to include the `cfg` `alias` in the local `.bash_profile`:
```sh
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Then, in the command line, run:
```sh
source ~/.bash_profile
```

## Installation
#### 1. Ensure that the source repo `.gitignore`'s the folder where `.cfg` will be cloned:
```sh
echo ".cfg" >> .gitignore
```

#### 2. Clone this repo into a "bare" repo in a hidden folder in the `$HOME` directory:
SSH:
```sh
git clone --bare git@github.com:PSalant726/dotfiles.git $HOME/.cfg
```
HTTPS:
```sh
git clone --bare https://github.com/PSalant726/dotfiles.git $HOME/.cfg
```

#### 3. Define the `alias` in the current shell scope (only required if not included in the local `.bash_profile`):
```sh
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

#### 4. Checkout the content from the bare repository in the `$HOME` directory:
```sh
cfg checkout
```
The step above might fail with a message like:
```sh
error: The following untracked working tree files would be overwritten by checkout:
    .bash_profile
    .gitconfig
Please move or remove them before you can switch branches.
Aborting
```
This is because the `$HOME` directory might already contain some stock configuration files that would be overwritten by this opteration. To resolve:
  1. Back up the files (if necessary), or remove them
  2. Re-run the `checkout`:
```sh
cfg checkout
```

#### 5. Set the flag `showUntrackedFiles` to `no` for the local repository:
This hides files that are not explicitly tracked. This is so that when running `cfg status` and other commands, files that are not of concern will not show up as `untracked`.
```sh
cfg config --local status.showUntrackedFiles no
```

## That's it! Type `cfg` commands to add and update `dotfiles`:
```sh
cfg status
...
cfg add .bash_aliases
cfg commit -m "Add an awesome new alias"
...
cfg add .bash_prompt
cfg commit -m "Make an awesome new bash prompt"
cfg push
```
