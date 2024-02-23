# pre-requisites

### Homebrew

Homebrew is very handy for MacOS and Linux, to installs the stuff you need in a simple way. It is a package manager for which makes installing lots of different software like Git, Ruby, and Node simpler. Homebrew lets you avoid possible security problems associated with using the sudo command to install software like Node.

Installing Homebrew is straightforward as long as you understand the Mac Terminal.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile

eval "$(/usr/local/bin/brew shellenv)"
brew update
```

> ./install-homebrew.sh

### Git

You also gonna need git to clone or pull public repositories from github.

```bash
brew install \
    git \
    tig
```

> ./install-git.sh

### Zsh 

```sh
brew install zsh

#chmod -R 755 '$(brew --prefix)/share/zsh'
chmod -R go-w '$(brew --prefix)/share/zsh'
```

- oh-my-zsh :

```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- iterm2 with Shell Integration

```bash
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
```

- Theme

brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

- Plugins

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

> ./install-zsh.sh

### neovim

```bash
brew update
brew install neovim
pip3 install pynvim
```

> ./install-neovim.sh

### Hyper

Use Homebrew to download install hyper:

```bash
brew update
brew install hyper
```

> ./install-hyper.sh


### Fish

Use Homebrew to download install fish:

```bash
brew update
brew install fish
```

> ./install-fish.sh