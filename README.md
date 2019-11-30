# Required Software & Settings
### Homebrew
Install with:
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Font
Install the `Hack Nerd` font:
```sh
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

### iTerm
1. Install with:
```sh
brew cask install iterm2
```
2. After cloning the bare `cfg` repo (details below), import the `iTerm_profile.json` file (Preferences > Other Actions... > Import JSON Profiles...)

### Additional Homebrew Services
1. Install [`bat`](https://github.com/sharkdp/bat), [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy), [`exa`](https://the.exa.website/), and [`fzf`](https://github.com/junegunn/fzf) with:
```sh
brew install bat diff-so-fancy exa fzf
```

### oh-my-zsh
1. Install with:
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
2. Install the `powerlevel10k` theme with:
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
3. Install the following plugins:
    1. `fast-syntax-highlighting`
    ```sh
    git clone --depth=1 https://github.com/zdharma/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
    ```
    2. `alias-tips`
    ```sh
    git clone --depth=1 https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
    ```
    3. [`forgit`](https://github.com/wfxr/forgit)
    ```sh
    mkdir $ZSH_CUSTOM/plugins/forgit/ && curl -Ss https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh -o $ZSH_CUSTOM/plugins/forgit/forgit.plugin.zsh
    ```
    4. [`enhancd`](https://github.com/b4b4r07/enhancd)
    ```sh
    git clone --depth=1 https://github.com/b4b4r07/enhancd.git $ZSH_CUSTOM/plugins/enhancd &&\
     mv $ZSH_CUSTOM/plugins/enhancd/init.sh $ZSH_CUSTOM/plugins/enhancd/enhancd.plugin.zsh
    ```

### VS Code
1. Download it [here](https://code.visualstudio.com/).
1. Install the [Settings Sync](https://github.com/shanalikhan/code-settings-sync) extension.
1. Follow the directions to add a GitHub token and synchronize settings with [this gist](https://gist.github.com/PSalant726/a179279267788effc1c4477cc069d04c).

### Source `.zshrc`
After completing the below steps to configure the `cfg` repo, restart iTerm or run:
```sh
source ~/.zshrc
```

# `dotfiles` Management with a Bare Git Repository
### Prerequisite
Prior to installation, make sure to include the `cfg` `alias` in the local `.bash_profile` or `.zshrc`:
```sh
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Then, in the command line, run:
```sh
source ~/.zshrc
# or
source ~/.bash_profile
```

### Installation
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

#### 3. Define the `alias` in the current shell scope (only required if not included in the local `.zshrc` or `.bash_profile`):
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
    .zshrc # or .bash_profile
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

### That's it! Type `cfg` commands to add and update `dotfiles`:
```sh
cfgs                                         # cfg status
...
cfga .zshrc                                  # cfg add
cfgcm -m "Add an awesome new alias"          # cfg commit
...
cfga .p10k.zsh
cfgcm -m "Make an awesome new bash prompt"
cfgps                                        # cfg push
```
