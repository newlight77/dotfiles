local trouble_ok, trouble = require("trouble.providers.telescope")
if not trouble_ok then
  return
end

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

keymap('i', '<c-t>', [[<cmd>lua require('trouble.providers.telescope').open_with_trouble()<CR>]], { noremap = true })
keymap('n', '<c-t>', [[<cmd>lua require('trouble.providers.telescope').open_with_trouble()<CR>]], { noremap = true })
