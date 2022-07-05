local status_ok, nvim_dap = pcall(require, "dap-python")
if not status_ok then
    return
end

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>dn', [[<cmd>lua require('dap-python').test_method()<CR>]], { noremap = true })
keymap('v', '<leader>ds', [[<cmd>lua require('dap-python').debug_selection()<CR>]], { noremap = true })
