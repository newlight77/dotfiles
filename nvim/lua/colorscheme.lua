
-- Set colorscheme (order is important here).
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme moonfly]]

--Set statusbar.
-- vim.g.lightline = {
--     colorscheme = 'moonfly',
--     active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
--     component_function = { gitbranch = 'fugitive#head' },
-- }

-- Set dark theme if macOS theme is dark, light otherwise.
local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
if (string.find(theme, 'Dark')) then
	vim.o.background = 'dark'
	vim.cmd [[colorscheme moonfly]]
else
	vim.o.background = 'light'
	vim.cmd [[colorscheme morning]]
end