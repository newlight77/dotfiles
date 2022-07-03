local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print "lspconfig did not work for some reason"
	return
end

require "plugs.lsp.configs"
require("plugs.lsp.lsp-installer")
require("plugs.lsp.handlers").setup()
require "plugs.lsp.null-ls"