# Neovim

# Setup

```bash
brew install neovim
```
## Packer

Neovim supports plugins (called extensions in VS Code). There are quite a few plugin managers : `vim-plug`, `pathogen` and `packer`. Well, so we will use `packer`. 

To get started, clone this repository to somewhere on your packpath:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Installing Language Servers

For TypeScript, let’s install `npm install -g typescript-language-server typescript`. You might not need to install typescript globally.

| Keymap       | Effect                   |
| -            | -                        |
| gD           | go to Declaration        |
| gd           | go to definition         |
| gr           | go to references         |
| gi           | go to implementations    |
| K            | Works like "hover" in most text editors that support a mouse. When placed above a function or variable, it will show a tooltip with types and docs. |
| leader+rn	   | Rename the object that is currently under the cursor. It can be used for renaming functions, variables, etc. |
| leader D     | Go to type definition.
| leader ca    | Open a code aaction menu. Quick fixes, refactors, etc. It's the same menu that would be opened by pressing the "lightbulb" in VS Code. |

## Plugins 

### nvimtree

`nvimtree` is a File Explorer For Neovim. 

Features:
- Automatic updates
- File type icons
- Git integration
- Diagnostics integration: LSP and COC
- (Live) filtering
- Cut, copy, paste, rename, delete, create
- Highly customisable

### Treesitter

`treesitter` is a parser tool, that builds a hierarchical syntax tree that is used internally by Neovim and various plugins to provide some crucial features like syntax highlighting and others. So let’s make sure to get it out of the way first.

### Auto-completion

The next plugin on our list is responsible for autocompletion. We want to get handy tips and suggestions when we are typing. In our case, cmp will be responsible for that (using the LSPs as the backend).

| Keymap       | Effect  |
| ctrl+space   | This will open the suggestions box, it works similarly to how VS Code’s autocompletion works. |
| ctrl+j       | Select next suggestion. |
| ctrl+k       | Select previous suggestion. |
| ctrl+d       | Scroll the documentation window down. |
| ctrl+f       | Scroll the documentation window up. |
| ctrl+e       | Close the suggestion box (exit). |

### Navigation

All that’s left is making sure we can quickly and easily navigate around our code and between our files. We have a plugin for that too. I use telescope with ripgrep as a backend for searching through my codebases.

However, some of them will require ripgrep to be installed on your system. On macOS, you can install it via `brew install ripgrep`.

| Keymap          | Effect |
| leader space    | Opens the telescope UI and searches through the names of your open buffers. In other words — use this to jump between your open files. |
| leader sf       | Search through project files. Telescope will search through the names of all the files in the current directory. Useful to open new files. |
| leader sp       | Search in the whole project. Works like SHIFT+F in other text editors. |

### Git

The last plugin we’ll configure is the gitsigns plugin. This will add great-looking git information in near the line numbers about whether a line was added, changed or modified. I find that particularly useful.

## Reference

- [install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package)
- [Guide to modern Neovim setup, 2021](https://tkg.codes/guide-to-modern-neovim-setup-2021/)
- [Neovim setting up snippets with luasnip](https://sbulav.github.io/vim/neovim-setting-up-luasnip/)