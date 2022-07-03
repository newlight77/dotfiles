local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- LSP settings
local lspconfig = require("lspconfig")
-- if (not lspconfig) then return end

-- Enable the following language servers. If you ever find yourself needing another programming language support, you'll have to find its LSP, add it to this list and make sure it is installed in your system! We'll go through installing tsserver together for TypeScript support.
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls' }

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("plugs.lsp.handlers").on_attach,
		capabilities = require("plugs.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "plugs.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end


-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set completeopt to have a better completion experience.
vim.o.completeopt = 'menuone,noselect'