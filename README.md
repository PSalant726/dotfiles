# Required Software & Settings

### Homebrew
Install with:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Font

Install the `JetBrains Mono` nerd font:

```sh
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
```

> Optional: Install the `Hack` nerd font:
>
> ```sh
> brew tap homebrew/cask-fonts
> brew install font-hack-nerd-font
> ```

### iTerm

1. Install with:

    ```sh
    brew install --appdir="~/Applications" iterm2
    ```

1. After cloning the bare `cfg` repo (details below), import the `iTerm_profile.json` file
    > Preferences -> Profiles -> Other Actions... -> Import JSON Profiles...

### Additional Tools

1. Install [`bat`](https://github.com/sharkdp/bat), [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy), [`exa`](https://the.exa.website/), [`fzf`](https://github.com/junegunn/fzf), [git](https://git-scm.com/), [`jq`](https://stedolan.github.io/jq/), [Go](https://golang.org/), `tree`, and [`zsh`](https://www.zsh.org/) via Homebrew, with:

    ```sh
    brew install bat diff-so-fancy exa fzf git jq go tree zsh
    $(brew --prefix)/opt/fzf/install

    # Use the homebrew zsh installation
    sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
    chsh -s /usr/local/bin/zsh
    ```

1. Install [Volta](https://volta.sh/) with:

    ```sh
    curl https://get.volta.sh | bash -s -- --skip-setup
    ```

    1. Install `node`, `npm`, and `yarn` with:

        ```sh
        volta install node npm yarn
        ```

    > Optional: Install [`emoj`](https://github.com/sindresorhus/emoj) via `yarn` with:
    >
    >   ```sh
    >   yarn add emoj
    >   ```

### oh-my-zsh

1. Install with:

    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

1. Install the `spaceship` theme with:

    ```sh
    git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```

    > Optional: Install the `powerlevel10k` theme (currently configured, but unused by default) with:
    >
    > ```sh
    > git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    > ```

1. Install the following plugins:
    1. `fast-syntax-highlighting`

        ```sh
        git clone --depth=1 https://github.com/zdharma/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
        ```

    1. `alias-tips`

        ```sh
        git clone --depth=1 https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
        ```

    1. [`forgit`](https://github.com/wfxr/forgit)

        ```sh
        mkdir $ZSH_CUSTOM/plugins/forgit/ && curl -Ss https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh -o $ZSH_CUSTOM/plugins/forgit/forgit.plugin.zsh
        ```

    1. [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)

        ```sh
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
        ```

### Firefox Developer Edition

1. Download Firefox Developer Edition [here](https://www.mozilla.org/en-US/firefox/developer/).
1. Log in with Firefox account
    1. This should sync bookmarks, extensions, etc.
1. Open `about:config` and change the following:
    1. `accessibility.typeaheadfind.matchesCountLimit` = `10000`
        - Increases the maximum number of results shown when searching a page for text with ⌘-F
    1. `dom.event.clipboardevents.enabled` = `false`
        - Prevents websites from blocking clipboard usage; helpful when pasting passwords from a password manager
    1. `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
        - Enables custom `userChrome.css` usage
1. Open `about:support`
    1. Find the "Profile Folder" section
    1. Navigate to the profile location using iTerm
    1. Create a new directory in the profile directory, called `chrome/`
    1. Copy/Paste the `userChrome.css` file from this repo into the `chrome/` directory
    1. Restart Firefox

### VS Code

1. Download it [here](https://code.visualstudio.com/).
1. Install the [Settings Sync](https://github.com/shanalikhan/code-settings-sync) extension.
1. Follow the directions to add a GitHub token and synchronize settings with [this gist](https://gist.github.com/PSalant726/a179279267788effc1c4477cc069d04c).

### Optional

Install the [`gotest` binary](https://github.com/rakyll/gotest) (to colorize `go test` output) by running the following **outside of any Go modules**:

```sh
go get -u github.com/rakyll/gotest
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
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
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

1. Clone this repo into a "bare" repo in a hidden folder in the `$HOME` directory:

    ```sh
    git clone --bare git@github.com:PSalant726/dotfiles.git $HOME/.cfg
    ```
    > Alternative: Clone via HTTPS
    > ```sh
    > git clone --bare https://github.com/PSalant726/dotfiles.git $HOME/.cfg
    > ```

1. Define the `alias` in the current shell scope (only required if not included in the local `.zshrc` or `.bash_profile`):

    ```sh
    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    ```

1. Checkout the content from the bare repository in the `$HOME` directory:

    ```sh
    cfg checkout
    ```
    > Note: The step above might fail with a message like:
    > ```sh
    > error: The following untracked working tree files would be overwritten by checkout:
    >     .zshrc # or .bash_profile
    >     .gitconfig
    > Please move or remove them before you can switch branches.
    > Aborting
    > ```
    > This is because the `$HOME` directory might already contain some stock configuration files that would be overwritten by this opteration. To resolve:
    >   1. Back up the files (if necessary), or remove them
    >   2. Re-run the `checkout`:
    > ```sh
    > cfg checkout
    > ```

1. Set the flag `showUntrackedFiles` to `no` for the local repository:

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
