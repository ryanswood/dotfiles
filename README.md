# Onehouse Dotfiles

## Setting up

Make sure you [have Homebrew installed](https://brew.sh/).

Install necessary packages:

```bash
$ brew install git zsh tmux vim stow
```

Clone this repo into your home directory and then cd into it to issue the stow command:

```bash
$ git clone git@github.com:onehouse/dotfiles.git onehouse-dotfiles
$ cd onehouse-dotfiles
$ stow vim zsh rubygems tmux git
```

Install the Tmux Plugin Manager:

```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux source ~/.tmux.conf
$ ~/.tmux/plugins/tpm/scripts/install_plugins.sh
```

Setup utility script symlinks:

```bash
$ mkdir -p ~/bin
$ ln -s ~/onehouse-dotfiles/bin/* ~/bin/
```

Add your `.zshrc.local` file to your home directory.  This is for customization specific to you.  You can either create an empty file or symlink from an existing location:

```bash
$ touch ~/.zshrc.local
# or
# ln -s ~/Dropbox/WorkstationConfig/zshrc.local .zshrc.local
```

## Removing stow

If you want to remove stow installed dotfiles, in case you want to stow again from another source, you can remove the existing dot symlinks with:

```bash
$ stow -D vim zsh rubygems tmux git
```
