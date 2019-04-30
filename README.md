# Dotfiles

## Setting up

Make sure you [have Homebrew installed](https://brew.sh/).

Install necessary packages:

```bash
$ brew install git zsh stow
```

Clone this repo into your home directory and then cd into it to issue the stow command:

```bash
$ git clone git@github.com:ryanswood/dotfiles.git dotfiles
$ cd dotfiles
$ stow vim zsh rubygems git
```

Setup git config:

```bash
$ cp templates/.gitconfig ~/
```

Setup utility script symlinks:

```bash
$ ln -s ~/dotfiles/bin/* /usr/local/bin/
```

Add your `.zshrc.local` file to your home directory.  This is for customization specific to you.  You can either create an empty file or symlink from an existing location:

```bash
$ touch ~/.zshrc.local
```

Setup VS Code
```bash
vscode/load-extensions.sh
cp vscode/conf.json ~/Library/Application\ Support/Code/User/settings.json
```

## Configure Iterm

- Uncheck `Preferences > Appearance > Show per-pane title bar with split panes`
- Load custom colors via `iTerm > Preferences > Profiles > Colors > Color Presets > Import`

Jona's suggestion. Unsure if this is what I want:
- In `Preferences > Profiles > Keys`, select **"+Esc"** from **"Left option key acts as"**

## Removing stow

If you want to remove stow installed dotfiles, in case you want to stow again from another source, you can remove the existing dot symlinks with:

```bash
$ stow -D vim zsh rubygems git
```
