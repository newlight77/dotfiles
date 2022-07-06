local status_ok, monfly = pcall(require, "vim-moonfly-colors")
if not status_ok then
	return
end


vim.cmd [[colorscheme moonfly]]
