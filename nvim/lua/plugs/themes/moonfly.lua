local status_ok, monfly = pcall(require, "vim-moonfly-colors")
if not status_ok then
	return
end

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.cmd [[colorscheme moonfly]]
