local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig["clangd"].setup{
	   cmd = { "clangd", "--background-index", "--clang-tidy", "-j=4", "--header-insertion=never" },
	   on_attach = attach,
	   single_file_support = true,
	   capabilities = capabilities
   }

   lspconfig["pyright"].setup{}
   lspconfig["cmake"].setup{}
   lspconfig["bashls"].setup{}
   lspconfig["rust_analyzer"].setup{}

end

return M
