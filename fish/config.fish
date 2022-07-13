set fish_greeting "hello fish"


# theme
set -gx TERM xterm-256color
set THEME_RC (dirname (status --current-filename))/theme.fish
if test -f $THEME_RC
  source $THEME_RC
end


# aliases
set ALIAS_RC (dirname (status --current-filename))/alias.fish
if test -f $ALIAS_RC
  source $ALIAS_RC
end


# NeoVim
set -gx EDITOR nvim


# Global Path
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


# NodeJS
set -gx PATH node_modules/.bin $PATH


# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
