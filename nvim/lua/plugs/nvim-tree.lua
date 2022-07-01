local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
	view = {
        width = 35,
        height = 30,
        hide_root_folder = false,
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "e", cb = tree_cb "edit" },
                { key = "c", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
		side = 'left'
	},
    filters = {
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
        root_folder_modifier = ":t",
        indent_markers = {
            enable = false,
            icons = {
                corner = " └ ",
                edge = " │ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
    },
    hijack_directories = {
        enable = false,
    },
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    log = {
        enable = true,
        truncate = true,
        types = {
          git = true,
          profile = true,
        },
    },
}

vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

-- nvim treep
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
