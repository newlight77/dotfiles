-- GENERAL SETTINGS
-- Dependencies
require("plugins")
require("keybindings")
require("lsp")

-- Plugin specific configs.
require("plugs.cmp")
require("plugs.gitsigns")
require("plugs.luasnip")
require("plugs.nvim-tree")
require("plugs.snippets")
require("plugs.telescope")
require("plugs.treesitter")
require("plugs.treesitter-textobjects")

-- Incremental live completion (note: this is now a default on master).
vim.o.inccommand = 'nosplit'

-- Set highlight on search.
vim.o.hlsearch = false

-- Make line numbers default.
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers (note: this is now a default on master).
vim.o.hidden = true

-- Enable mouse mode.
vim.o.mouse = 'a'

-- Enable break indent.
vim.o.breakindent = true

-- Set tab length to 4 spaces.
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme (order is important here).
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme moonfly]]

--Set statusbar.
vim.g.lightline = {
  colorscheme = 'moonfly',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Set dark theme if macOS theme is dark, light otherwise.
local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
if (string.find(theme, 'Dark')) then
	vim.o.background = 'dark'
	vim.cmd [[colorscheme moonfly]]
else
	vim.o.background = 'light'
	vim.cmd [[colorscheme morning]]
end