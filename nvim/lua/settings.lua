
-- Incremental live completion (note: this is now a default on master).
vim.o.inccommand = 'nosplit'

-- Do not save when switching buffers (note: this is now a default on master).
vim.o.hidden = true

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"

-- Enable mouse mode.
vim.o.mouse = 'a'

-- Save undo history.
vim.o.undofile = true

-- faster completion (4000ms default). Also used for CursorHold event
vim.o.updatetime = 300

-- the encoding written to a file
vim.o.fileencoding = "utf-8"

vim.o.sessionoptions = "folds"


-- Term GUI colors
----------------------------------------------------
vim.o.termguicolors = true
-- Set dark theme if macOS theme is dark, light otherwise.
local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
if (string.find(theme, 'Dark')) then
	vim.o.background = 'dark'
else
	vim.o.background = 'light'
end


-- lines display
----------------------------------------------------
-- set numbered lines
vim.wo.number = true
-- set relative numbered lines
vim.wo.relativenumber = true
-- set number column width to 2 {default 4}
vim.o.numberwidth = 4
-- always show the sign column, otherwise it would shift the text each time
vim.wo.signcolumn = 'yes'
-- display lines as one long line
vim.o.wrap = false
-- display a line on the cursor
vim.o.cursorline = true



-- indentation
----------------------------------------------------
-- convert tabs to spaces
vim.o.expandtab = true
-- make indenting smarter again
vim.o.smartindent = true
-- the number of spaces inserted for each indentation
vim.o.shiftwidth = 4
-- Enable break indent.
vim.o.breakindent = true



-- tabs
--------------------------------------------------
-- Set tab length to 4 spaces.
vim.o.tabstop = 4
vim.o.shiftwidth = 4



-- window split
--------------------------------------------------
-- force all horizontal splits to go below current window
vim.o.splitbelow = true
-- force all vertical splits to go to the right of current window
vim.o.splitright = true



-- searching
---------------------------------------------------
-- highlight all matches on previous search pattern
vim.o.hlsearch = true
-- Case insensitive searching UNLESS /C or capital in search.
vim.o.ignorecase = true
-- smart case
vim.o.smartcase = true


-- yank
---------------------------------------------------
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
