require'nvim-tree'.setup {
	view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
		side = 'left'
	},
    filters = {
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
    },
}

vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })