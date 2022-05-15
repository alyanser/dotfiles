local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig["clangd"].setup {
	   cmd = { "clangd", "-j=4", "--background-index", "--clang-tidy=false", "--header-insertion=never", "--log=error", "--completion-style=detailed" },
	   single_file_support = true,
	   file_types = {"cpp", "c", "cxx", "hxx", "hpp", "h", "cc"},
	   capabilities = capabilities,
	   on_attach = attach,
   }

   -- lspservers with default config
   local servers = { "pyright", "asm_lsp", "bashls", "cmake" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
end

return M
