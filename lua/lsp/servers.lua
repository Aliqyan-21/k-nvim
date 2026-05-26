-- Configure LSP servers and their settings
local mason_lspconfig = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

require("mason").setup({
  ui = { border = "rounded" }
})

-- Get capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

local configs = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  nim_langserver = {
    cmd = { "nimlangserver" },
    filetypes = { "nim", "nimrod" },
    settings = {
      nim = { nimsuggestPath = vim.fn.expand("~/.nimble/bin/nimsuggest") }
    }
  },
  idris2_lsp = {
    cmd = { "idris2-lsp" },
    filetypes = { "idris2" },
    root_markers = { "*.ipkg", ".git" },
  },
}

-- Mason-LSPconfig setup
mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "jsonls", "cssls", "html", "clangd", "gopls", "zls" },
  automatic_installation = true,
})

-- config, enable
local all_servers = mason_lspconfig.get_installed_servers()
table.insert(all_servers, "nim_langserver")
table.insert(all_servers, "racket_langserver")
table.insert(all_servers, "idris2_lsp")
for _, server in ipairs(all_servers) do
  local config = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, configs[server] or {})
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
