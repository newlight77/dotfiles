# dotfiles

Use this repository to customize your envrionment:

- Bash
- Zsh with Oh my zsh
- Fish with fisher (work in progress)
- Vim / NeoVim with Vim-Plug (work in progress)

Use this to customize your bash profile, it comes with :

- set of useful functions and aliases
- set colorfull shell

Please feel free to install zsh with oh-my-zsh.

> Alternatively, you may want to setup fish instead of zsh and oh-my-zsh.

> For Vim/NeoVim users, you may customize you vimrc with :

- set of plugins
- set of functions
- keys mappings
- colorscheme

You can also add environment specific variables in $HOME/.config/bash/.bashrc_vars

## Compatibility

- Windows Git-Bash
- Mac OS
- Linux

## Pre-requisites

Please refer to this page : [pre-requisites](/pre-requisites.md).

> Shortcuts : run the following scripts to install all pre-requisites

Install Homebrew:
```bash
curl -L https://raw.githubusercontent.com/newlight77/macosx/main/install-homebrew.sh | bash
```

## Setup

To start with, this dotfiles repository provides 4 parts :

- bash/zsh setup
- vim/neovim Setup (work in progress)

### Only Bash

1. Customize bash:

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-bash.sh | bash
```

Then jump to step 3.

### Using Zsh & oh-my-zsh

1. Install Zsh:

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-zsh.sh | bash
```

2. Customize zsh:

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-zsh.sh | bash
```

3. Configure git aliases

```bash
mkdir -p ${HOME}/.config/git/
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/git/.gitconfig_alias -o ${HOME}/.config/git/gitconfig_alias

git config --global include.path $HOME/.config/git/.gitconfig_alias
```

5. Add your own shell aliases

Examples :

```bash
echo '
alias cdclones="cd ~/workspace/clones"
alias cdoneprofile="cd ~/workspace/oneprofile"
alias cdnewlight="cd ~/workspace/newlight77"

alias clones="cdclones"
alias oneprofile="cdoneprofile"
alias newlight="cdnewlight"
' >> $HOME/.config/bash/.bashrc_alias_extended
```

### Undo

```bash
rm -rf $HOME/.config/bash
#rm -rf $HOME/.config/nvim
#rm -rf $HOME/.config/hyper
```

Then update (by removing dotfiles related changes source) the .zprofile, .bashrc, .vimrc, .config/nvim/init.vim accordingly.

## Additional Customization

## FZF Keyboard shortcuts

This will add the following shortcuts:

- `CTRL + r` will search backwards through your zsh history. This is a fuzzy search, e.g. terraform tfstate will bring up all commands in history that have terraform and tfstate anywhere in the command line. Great for finding commands where you don't remember the exact syntax you used.

- `ESC + c` will search all directories below the current working directory then cd to the result. Great for quickly jumping to a deep directory.

- `CTRL + t` will use MacOS' Spotlight to search all files and directories below the current working directory then put that result on the command line, ready for a CTRL + a to add a command before it. Great for when you're not sure where you put that file. Alternatively, type your command then hit CTRL + t to add a file afterwards.

## FAG

1. How-To ? If I got this error :

```bash
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```

Answer : it suggests to run compaudit. So the just run `compaudit | xargs chmod g-w` to remove group-write permissions.

## Vim Cheat Sheet

[Vim Cheat Sheet](https://vim.rtorr.com/)

## Reference

- [iterm2 shell-integration](https://iterm2.com/documentation-shell-integration.html)
- [oh my zsh](https://ohmyz.sh/)
- [bash-it](https://github.com/Bash-it/bash-it)
- [How to Configure your macOs Terminal with Zsh like a Pro](https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/)

- [neovim](https://neovim.io/)
- [Neovim Preconfigured by NvChad](https://github.com/newlight77/NvChad)
- [Neovim Preconfigured by newlight77](https://github.com/newlight77/neovim-preconfigured)
- [Neovim Setup by Ben Simmonds](https://www.bencode.net/posts/vim/)

- [Hyper](https://hyper.is/#installation)
- [Hyper awesome](https://github.com/bnb/awesome-hyper)


# TODO

- move all git install and config to macosx repo
