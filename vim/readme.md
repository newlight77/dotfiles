# Vim

## Setup

Run the below command to setup all vim config  :

```bash
curl -L https://raw.githubusercontent.com/newlight77/ndotfiles/main/customize-vim.sh | bash
```

The following folders are created :

```tree
.vim/
 ├── autoload/
 ├── backup/
 ├── colors/
 └── plugged/

.ndotfiles/
 ├── vim_config/
 ├───── after/
 ├──────── plugin/
```

### Undo (cleaning)

```bash
rm -fr /tmp/ndotfiles
rm -rf $HOME/.ndotfiles/vim_config
```

Then update (by removing ndotfiles related changes source) the .zprofile, .bashrc, .vimrc accordingly.


### Vim

```bash
brew remove vim
brew cleanup

brew install vim
brew install fzf
brew install fd
brew install ripgrep
```

```bash
vim
:PlugInstall
:UpdateRemotePlugins
:q!
:q!
```

### vim-autoload

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Get healthy

Open vim and enter the following:

```bash
:checkhealth 
:checkhealth telescope
```


### You Complete Me (a vim plugin)

For YouCompleteMe, you need to compile the package:

```bash
brew install cmake
cd .vim/plugged/youcompleteme
python3 ./install.py 
```

### CoC (a vim plugin)

[Install CoC](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim)
[CoC extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

for generic web-development consider `:CocInstall coc-tsserver coc-json coc-html coc-css`

for the list of extensions : `:CocList extensions`

### deoplete

deoplete requires Neovim or Vim8 with if_python3. You can enable Python3 interface with pip:

```bash
pip3 install --user pynvim

# deoplete needs pynvim ver.0.3.0+.
pip3 install --user --upgrade pynvim
```

### Language Server Protocol (lsp)

To use LSP, there are two parts involved. First, we need to install a language server for the language we use. Second, we need to use a plugin that acts as an LSP client that communicates with this server.

There are quite a few LSP clients out there. Some of the most popular ones are:

- coc.nvim
- vim-lsp
- LanguageClient-neovim
- vim-lsc

Neovim built-in LSP client (you need to install nvim-lspconfig for easier configuration)

First, we need to install a language server for Python. pyls is good choice. First, install pyls:

```bash
pip install "python-language-server[all]"
```

#### lsp-config & nvim-lsp-installer

`nvim-lsp-installer` allows you to manage LSP servers (servers are installed inside `:echo stdpath("data")` by default). It works in tandem with `lsp-config` by registering a hook that enhances the PATH environment variable, allowing neovim's LSP client to locate the server executable installed by `nvim-lsp-installer`.

`nvim-lsp-installer` will only make sure that Neovim can find your installed servers, it does not set up any servers for you automatically. You will have to set up your servers yourself (for example via lspconfig).

### Vim Cheat Sheet

[Vim Cheat Sheet](https://vim.rtorr.com/)

## Reference

- [neovim](https://neovim.io/)
- [vimrc](https://github.com/amix/vimrc)
- [vim awesome](https://vimawesome.com/)
- [vimrc example](https://github.com/gerardbm/vimrc)
- [How to set up Neovim 0.5 + Modern plugins (LSP, Treesitter, Fuzzy finder, etc)](https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887)
