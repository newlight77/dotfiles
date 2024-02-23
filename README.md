# dotfiles

Use this repository to customize your envrioment:

- Vim / NeoVim with Vim-Plug
- Zsh with Oh my zsh
- Fish with fisher

Use this to customize your bash profile, it comes with :

- set of useful functions and aliases
- set colorfull shell
- git config and aliases

Please feel free to install zsh with oh my zsh.

Alternatively, you may want to setp fish instead of zsh and oh my zsh.

For Vim/NeoVim users, you may customize you vimrc with :

- set of plugins
- set of functions
- keys mappings
- colorscheme

You can also add environment specific variables in $HOME/.config/bash/.bashrc_vars

## Compatibility

- Windows Git-Bash
- Mac OS
- Linux

## Prerequisites

Please refer to this page : [pre-requisites](/pre-requisites.md).

> Shortcuts : run the following scripts to install all pre-requisites

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-homebrew.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-git.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-hyper.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-neovim.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-zsh.sh | bash
```

## Setup

To start with, this dotfiles repository provides 4 parts :

- bash/zsh setup
- git setup
- vim/neovim Setup
- hyper configuration
- utils files (few scripts not so useful for now)

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-bash.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-fish.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-git.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-hyper.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-nvim.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-util.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-zsh.sh | bash
```

### Undo

```bash
rm -fr /tmp/dotfiles
rm -rf $HOME/.config/bash
rm -rf $HOME/.config/git
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/hyper
rm -rf $HOME/.onfig/util
```

Then update (by removing dotfiles related changes source) the .zprofile, .bashrc, .vimrc, .config/nvim/init.vim accordingly.

## Additional Customization

### Git

```bash
git config --global core.editor nano
git config --global user.name 'fullname'
git config --global user.email 'example@mail.com'
```

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

