# dotfiles

My environment configuration.

## Required Software & Settings

### Homebrew

Install with:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Homebrew Packages

Install everything in [the `Brewfile`](.config/homebrew/Brewfile):

```sh
brew bundle --file=~/.config/homebrew/Brewfile

# Use the homebrew zsh installation (ensure $HOMEBREW_PREFIX is set first!)
sudo sh -c "echo $HOMEBREW_PREFIX/bin/zsh >> /etc/shells"
chsh -s $HOMEBREW_PREFIX/bin/zsh
```

> [!TIP]
> Run `brewup` to upgrade and clean up Homebrew, then check for installed packages missing from the `Brewfile`. Add new packages with:
>
> ```sh
> brew bundle add --file=~/.config/homebrew/Brewfile <formula>
> brew bundle add --cask --file=~/.config/homebrew/Brewfile <cask>
> ```

### Ghostty

Get it from [the official site](https://ghostty.org), or install via Homebrew with:

```sh
brew install --cask ghostty
```

### Firefox Developer Edition

1. Download Firefox Developer Edition from [the official source](https://www.mozilla.org/en-US/firefox/developer/).
1. Log in with Firefox account. This should sync bookmarks, extensions, etc.
1. Open `about:support` and copy the path from the "Profile Folder" section.
1. Grant the terminal app Full Disk Access (System Settings → Privacy & Security → Full Disk Access), so it can access the profile folder.
1. Close Firefox, then symlink `user.js` and `userChrome.css` from this repo into the profile folder:

```sh
P="<profile folder path>"; mkdir -p "$P/chrome" &&\
    ln -sf "$HOME/.config/firefox/user.js" "$P/user.js" &&\
    ln -sf "$HOME/.config/firefox/userChrome.css" "$P/chrome/userChrome.css"
```

### Zed Editor

Download it from [the official source](https://zed.dev/download).

## Source `.zshrc`

After completing the below steps to configure the `cfg` repo, restart the terminal or run:

```sh
source ~/.zshrc
```

## `dotfiles` Management with a Bare Git Repository

### Prerequisite

Prior to installation, make sure to include the `cfg` alias in the local `.bash_profile` or `.zshrc`:

```sh
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
```

Then, in the command line, run:

```sh
source ~/.zshrc
# or
source ~/.bash_profile
```

### Installation

1. Ensure that the source repo `.gitignore`'s the folder where `.cfg` will be cloned:

   ```sh
   echo ".cfg" >> .gitignore
   ```

2. Clone this repo into a "bare" repo in a hidden folder in the `$HOME` directory:

   ```sh
   git clone --bare git@github.com:PSalant726/dotfiles.git $HOME/.cfg
   ```

> [!TIP]
> To clone via HTTPS:
>
> ```sh
> git clone --bare https://github.com/PSalant726/dotfiles.git $HOME/.cfg
> ```

3. Define the `alias` in the current shell scope (only required if not included in the local `.zshrc` or `.bash_profile`):

   ```sh
   alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
   ```

4. Checkout the content from the bare repository in the `$HOME` directory:

   ```sh
   cfg checkout
   ```

> [!WARNING]
> The above command might fail with a message like:
>
> ```sh
> error: The following untracked working tree files would be overwritten by checkout:
>     .zshrc # or .bash_profile
>     .gitconfig
> Please move or remove them before you can switch branches.
> Aborting
> ```
>
> This is because the `$HOME` directory might already contain some stock configuration files that would be overwritten by this opteration. To resolve:
>
> 1. Back up the files (if necessary), or remove them
> 2. Re-run the `checkout`:
>
>    ```sh
>    cfg checkout
>    ```

5. Set the flag `showUntrackedFiles` to `no` for the local repository:

   This hides files that are not explicitly tracked. This is so that when running `cfg status` and other commands, files that are not of concern will not show up as `untracked`.

   ```sh
   cfg config --local status.showUntrackedFiles no
   ```

### That's it! Type `cfg` commands to add and update `dotfiles`

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
