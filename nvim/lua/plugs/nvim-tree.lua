require'nvim-tree'.setup {
	view = {
        adaptive_size = true,
        filters = {
            dotfiles = false,
        },
        renderer = {
            group_empty = true,
        },
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
		side = 'left'
	}
}

vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })