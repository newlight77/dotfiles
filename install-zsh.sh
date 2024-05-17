#!/bin/bash

installBrew() {

    if [ $(which brew) != 'brew not found'];then
        return
    fi

    echo '........ installing brew ........'

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zprofile
    eval "$($(brew --prefix)/bin/brew shellenv)"

    brew update
}

installBashCompletion() {
    echo '........ installing bash-completion ........'

    brew install bash-completion

    echo '[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.bashrc
}

installZsh() {
    echo '........ installing zsh ........'

    brew install zsh

    #chmod -R 755 '$(brew --prefix)/share/zsh'
    chmod -R go-w '$(brew --prefix)/share/zsh'
}

installOhMyZsh() {
    echo '........ installing oh-my-zsh ........'

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

installShellIntegration() {
    echo '........ installing shell integration ........'

    curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
}

installZshCompletions() {
    echo '........ installing zsh-completion ........'

    brew install zsh-completions

    echo '
    if type brew &>/dev/null; then
        FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
        FPATH=$(brew --prefix)/share/zsh-navigation-tools:$FPATH
        FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
        FPATH=$HOME/.oh-my-zsh/plugins/git:$FPATH
        FPATH=$HOME/.oh-my-zsh/lib/functions:$FPATH
        FPATH=$HOME/.oh-my-zsh/lib/completions:$FPATH
        FPATH=$HOME/.oh-my-zsh/cache/completions:$FPATH
        FPATH=$(brew --prefix)/Cellar/zsh/5.9/share/zsh/functions:$FPATH

        autoload -Uz compinit
        compinit
    fi
    ' >> ~/.zprofile
}

installZshAutosuggestions() {
    echo '........ installing zsh-completion ........'

    brew install zsh-autosuggestions

    echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zprofile
}

installZshHistorySubstringSearch() {
    echo '........ installing zsh-history-substring-search ........'

    brew install zsh-history-substring-search

    echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile
}

installZshSyntaxHighlighting() {
    echo '........ installing zsh-syntax-highlighting ........'

    brew install zsh-syntax-highlighting

    echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters' >> ~/.zprofile
}

installZshNavigationTools() {
    echo '........ installing zsh-navigation-tools ........'

    brew install zsh-navigation-tools

    echo 'source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh' >> ~/.zprofile
}

activateZshPlugins() {
    echo '........ activate zsh plugins........'

    sed -i -e "/plugins=(git)/plugins=(alias-finder brew common-aliases copypath copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm urltools vi-mode vscode web-search z)/g" ~/.zshrc
    echo 'ZSH_ALIAS_FINDER_AUTOMATIC=”true”' >> ~/.zprofile
}

installZshThemePowerlevel10k() {
    echo '........ activate zsh theme powerlevel10k........'

    brew install romkatv/powerlevel10k/powerlevel10k

    echo 'source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zprofile
}


installBrew

installBashCompletion
installZsh
installOhMyZsh
installShellIntegration

# install zsh plugins
installZshCompletions
installZshAutosuggestions
installZshHistorySubstringSearch
installZshSyntaxHighlighting
installZshNavigationTools
activateZshPlugins

installZshThemePowerlevel10k