equire'nvim-tree'.setup {
	view = {
		side = 'right'
	}
}

vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })