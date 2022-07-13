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

- Homebrew

Homebrew is very handy for MacOS and Linux, to installs the stuff you need in a simple way. It is a package manager for which makes installing lots of different software like Git, Ruby, and Node simpler. Homebrew lets you avoid possible security problems associated with using the sudo command to install software like Node.

Installing Homebrew is straightforward as long as you understand the Mac Terminal.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile

eval "$(/usr/local/bin/brew shellenv)"
brew update
```

- Git

You also gonna need git to clone or pull public repositories from github.

```bash
brew install \
    git \
    tig

git config --global core.editor nano
git config --global user.name 'fullname'
git config --global user.email 'example@mail.com'
```

## Setup

To start with, this dotfiles repository provides 4 parts :

- bash setup
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

## Hyper

Use Homebrew to download install hyper:

```bash
brew update
brew install hyper
```

## Zsh

```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


### iterm2 with Shell Integration

```bash
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
```

### Theme

brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

### Plugins

```bash
brew install zsh-completions

echo "
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
" >> ~/.zprofile

brew install zsh-syntax-highlighting
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zprofile

brew install zsh-autosuggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zprofile

brew install zsh-history-substring-search
echo 'source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile

brew install zsh-syntax-highlighting
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zprofile

sed -i -e "/plugins=(git)/plugins=(alias-finder brew common-aliases copydir copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm npx osx urltools vi-mode vscode web-search z)/g" ~/.zshrc
```

### Vim Cheat Sheet

[Vim Cheat Sheet](https://vim.rtorr.com/)

## SSH

## Git

```bash
Git
brew install \
    git \
    tig

git config --global core.editor nano
git config --global user.name 'fullname'
git config --global user.email 'example@mail.com'
```

## Github

```bash
echo '
machine api.github.com
login <user>
password <token>
' >> ~/.netrc
```

Github requires a personal access token, a gpg key, and a ssh key.

Generate GPG Key:

```bash
gpg --gen-key
#which will prompt you for name, email and secret.
```

Now encrypt it using the gpg key, where <EMAIL> is the address you used when creating the key

```bash
gpg -e -r <EMAIL> ~/.netrc
```

### Github enterprise

If you want to access github entreprise on premiss, set this in vimrc :

```bash
let g:github_enterprise_urls = ['https://example.com']
```

### git credentials using git-credential-netrc (optional)

Note : This step is already covered by customize-git.sh.

You gonna need a credential helper to decrypt the .netrc file automatically by git:

```bash
echo "creating folder $HOME/.config/util" 1>&2
mkdir $HOME/.config/util/

echo "retrieve the git-credential-netrc from github"
curl -o $HOME/.config/util/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
chmod +x $HOME/.config/util/git-credential-netrc

echo "adding export GPG_TTY and add git-credential-netrc to PATH in $HOME/.zshrc" 1>&2
echo '
# ===================================================================
# added by https://github.com/newlight77/dotfiles
export PATH=$HOME/.config/util/:$PATH
export GPG_TTY=$(tty)
# ===================================================================
' >> $HOME/.zshrc
```

At last, configure git to use credential helper

```bash
git config --global credential.helper "netrc -f ~/.netrc.gpg -v"
# automatically sign commits
git config --global commit.gpgsign true
```

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

