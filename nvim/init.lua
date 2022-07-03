-- Enable impatient if installed
require("plugs.impatient")

-- General Cettings
require("settings")
require("keybindings")
require("autocmds")

-- Dependencies
require("plugins")
require("lsp")

-- Plugin Configs
require("plugs.cmp")
require("plugs.gitsigns")
require("plugs.nvim-tree")
require("plugs.snippets")
require("plugs.telescope")
require("plugs.treesitter")
require("plugs.treesitter-textobjects")


-- UI and Colorscheme
require("colorscheme")
