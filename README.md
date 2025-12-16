# Required Software & Settings

### Homebrew
Install with:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Font

Install the `JetBrains Mono` nerd font:

```sh
brew install font-jetbrains-mono-nerd-font
```

> [!TIP]
> Optionally, install the `Hack` nerd font:
>
> ```sh
> brew install font-hack-nerd-font
> ```

### Ghostty

1. Get it from [the official site](https://ghostty.org), or install via Homebrew with:

    ```sh
    brew install --cask ghostty
    ```

1. After cloning the bare `cfg` repo (details below), add the following line to the default Ghostty config file:

    ```
    config-file = /path/to/.ghostty
    ```

### Additional Tools

1. Install the following with Homebrew:
    - [`bat`](https://github.com/sharkdp/bat)
    - [`direnv`](https://direnv.net/)
    - [`eza`](https://github.com/eza-community/eza)
    - [`fzf`](https://github.com/junegunn/fzf)
    - [git](https://git-scm.com/)
    - [`git-delta`](https://github.com/dandavison/delta)
    - [Go](https://golang.org/)
    - [`jq`](https://stedolan.github.io/jq/)
    - [`tree`](https://gitlab.com/OldManProgrammer/unix-tree)
    - [`zsh`](https://www.zsh.org/)

    ```sh
    brew install bat direnv eza fzf git git-delta go jq tree zsh
    $(brew --prefix)/opt/fzf/install

    # Use the homebrew zsh installation (ensure $HOMEBREW_PREFIX is set first!)
    sudo sh -c "echo $HOMEBREW_PREFIX/bin/zsh >> /etc/shells"
    chsh -s $HOMEBREW_PREFIX/bin/zsh
    ```

    > [!TIP]
    > Optionally, install the following additional tools with Homebrew:
    > - [`pyenv`](https://github.com/pyenv/pyenv)
    > - [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv)
    >
    >   ```sh
    >   brew install pyenv pyenv-virtualenv
    >   ```

1. Install [Volta](https://volta.sh/) with:

    ```sh
    curl https://get.volta.sh | bash -s -- --skip-setup
    ```

    1. Install `node`, `npm`, and `yarn` with:

        ```sh
        volta install node npm yarn
        ```

### oh-my-zsh

1. Install with:

    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

1. Install the `powerlevel10k` theme with:

    ```sh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    ```

    > [!NOTE]
    > Optionally, install the `spaceship` theme (currently configured, but unused by default) with:
    >
    > ```sh
    > git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
    > ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    > ```

1. Install the following plugins:
    - [`alias-tips`](https://github.com/djui/alias-tips)
    - [`F-Sy-H`](https://github.com/z-shell/F-Sy-H) (Fast Syntax Highlighting)
    - [`forgit`](https://github.com/wfxr/forgit)
    - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)

    ```sh
    git clone --depth=1 https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips &&\
    git clone --depth=1 https://github.com/z-shell/F-Sy-H.git $ZSH_CUSTOM/plugins/F-Sy-H &&\
    git clone --depth=1 https://github.com/wfxr/forgit.git $ZSH_CUSTOM/plugins/forgit &&\
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    ```

### Firefox Developer Edition

1. Download Firefox Developer Edition [here](https://www.mozilla.org/en-US/firefox/developer/).
1. Log in with Firefox account
    1. This should sync bookmarks, extensions, etc.
1. Open `about:support`
    1. Find the "Profile Folder" section
    1. Navigate to the profile location using iTerm
    1. Close Firefox
    1. Copy/Paste the `user.js` file from this repo into the profile directory
    1. Create a new directory in the profile directory, called `chrome/`
    1. Copy/Paste the `userChrome.css` file from this repo into the `chrome/` directory
    1. Open Firefox

### VS Code

Download it [here](https://code.visualstudio.com/). Sync extensions and preferences natively.

### Optional

Install the [`gotest` binary](https://github.com/rakyll/gotest) (to colorize `go test` output) by running the following **outside of any Go modules**:

```sh
go install github.com/rakyll/gotest@latest
```

### Source `.zshrc`

After completing the below steps to configure the `cfg` repo, restart iTerm or run:

```sh
source ~/.zshrc
```

# `dotfiles` Management with a Bare Git Repository

### Prerequisite

Prior to installation, make sure to include the `cfg` alias in the local `.bash_profile` or `.zshrc`:

```sh
alias cfg="$HOMEBREW_PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
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
    alias cfg="$HOMEBREW_PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
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
    >   1. Back up the files (if necessary), or remove them
    >   2. Re-run the `checkout`:
    >
    >       ```sh
    >       cfg checkout
    >       ```

5. Set the flag `showUntrackedFiles` to `no` for the local repository:

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
