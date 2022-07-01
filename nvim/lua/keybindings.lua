-- KEYBINDINGS

-- Plugin specific keybindings are in the plugin's config files.
-- I tend to keep those related to the whole editor here, 
-- while leaving the ones for specific plugins to their own configuration files. 
-- That way if I ever remove or change plugins I can keep my keybindings clean.

local opts = { noremap = true, silent = true }
local opts_with_expr = { noremap = true, expr = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
-- In general, the `nvim_set_keymap` is the function we can use to create any keymap you'd wish.
local map = vim.api.nvim_set_keymap

-- Remap space as leader key. Leader key is a special key that will allow us to make some additional keybindings. I'm using a spacebar, but you can use whatever you'd wish. We'll use it (for example) for searching and changing files (by pressing spacebar, then `s` and then `f`).
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- save buffer to file
map("n", "<C-s>", ":w<CR>", opts)

-- save file as sudo on files that require root permission
map("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", opts)

-- Cute tricks
map("n", "<esc>", ":noh<CR><ESC>", opts)
map("n", "Y", "y$", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- move selected lines.
map("n", "j", ":move .+1<CR>==", opts)
map("n", "k", ":move .-2<CR>==", opts)
-- map("v", "j", ":move '>+1<CR>gv=gv", opts)
-- map("v", "k", ":move '<-2<CR>gv=gv", opts)

-- avoid yanked buffer change after paste
map("v", "p", '"_dP', opts)

-- File explorer
map("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigate buffers
map("n", "<S-left>", ":bnext<CR>", opts)
map("n", "<S-right>", ":bprevious<CR>", opts)

-- Delete current buffer
map("n", "<leader>d", ":bdelete<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("i", "<C-Up>", ":resize +2<CR>", opts)
map("i", "<C-Down>", ":resize -2<CR>", opts)
map("i", "<C-Left>", ":vertical resize -2<CR>", opts)
map("i", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("v", "J", ":m .+1<CR>==", opts)
map("v", "K", ":m .-2<CR>==", opts)

-- open current file in browser
map("n", "<leader>w", ":exe ':silent !brave %'<CR>", opts)

-- dot commands on visual blocks
map("v", ".", ":normal .<C>", opts)

-- Splits
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>h", ":split<CR>", opts)

-- Terminal --
map("n", "<leader>z", ":14sp +terminal<CR>i", opts)

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- jump to tab using leader and tab number
map("n", "<leader>1", "1gt", opts)
map("n", "<leader>2", "2gt", opts)
map("n", "<leader>3", "3gt", opts)
map("n", "<leader>4", "4gt", opts)
map("n", "<leader>5", "5gt", opts)
map("n", "<leader>6", "6gt", opts)
map("n", "<leader>7", "7gt", opts)
map("n", "<leader>8", "8gt", opts)
-- map("n", "<C-w>", "tabclose", opts)

-- tab does not work in vim :(
-- map("n", "<C-tab>", ":tabn<CR>", opts)
-- map("n", "<C-S-tab>", ":tabp<CR>", opts)

-- command line commands
map("c", "w!!", ":write !sudo tee  > /dev/null %", opts)

-- Prettify code
map("n", "<leader>p", "<cmd>Format<cr>", opts)

-- Cheat
map("n", "<leader>c", "<cmd>Cheat<cr>", opts)

-- Remap for dealing with word wrap. 
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", opts_with_expr)
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", opts_with_expr)


