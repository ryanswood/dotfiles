# Onehouse Dotfiles

## Setting up

Install necessary packages:

```bash
$ brew install git zsh tmux vim stow reattach-to-user-namespace
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

## Removing stow

If you want to remove stow installed dotfiles, in case you want to stow again from another source, you can remove the existing dot symlinks with:

```bash
$ stow -D vim zsh rubygems tmux git
```
