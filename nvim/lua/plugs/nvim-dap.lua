local status_ok, nvim_dap = pcall(require, "dap")
if not status_ok then
    return
end

local keymap = vim.api.nvim_set_keymap

keymap('n', '<F5>',       [[<cmd>lua require('dap').continue()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>dd', [[<cmd>lua require('dap').continue()<CR>]], { noremap = true, silent = true })
keymap('n', '<F10>',      [[<cmd>lua require('dap').step_over()<CR>]], { noremap = true, silent = true })
keymap('n', '<F11>',      [[<cmd>lua require('dap').step_into()<CR>]], { noremap = true, silent = true })
keymap('n', '<F12>',      [[<cmd>lua require('dap').step_out()<CR>]], { noremap = true, silent = true })

keymap('n', '<leader>b',  [[<cmd>lua require('dap').toggle_breakpoint()<CR>]], { noremap = true })
keymap('n', '<leader>B',  [[<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true })
keymap('n', '<leader>lp', [[<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { noremap = true })
keymap('n', '<leader>dr', [[<cmd>lua require('dap').repl.open()<CR>]], { noremap = true })
keymap('n', '<leader>dl', [[<cmd>lua require('dap').repl.run_last()<CR>]], { noremap = true })
