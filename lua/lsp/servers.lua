-- Configure LSP servers and their settings
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  lspconfig = false -- Critical: Prevents automatic LSP setup
})

local mason_lspconfig = require("mason-lspconfig")

-- Get capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Common on_init function
local on_init = function(client)
  client.offset_encoding = 'utf-8'
end

-- First: Configure Lua LSP separately before Mason
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
  before_init = function(params)
    params.workDoneToken = "1" -- Unique identifier to prevent duplicate
  end
})

-- Mason setup
require("mason").setup({
  ui = { icons = { installed = "✓", pending = "➜", uninstalled = "✗" } }
})

-- Server configurations for other servers
local server_configs = {
  jsonls = {
    settings = { json = { validate = { enable = true } } }
  }
}

-- Mason-LSPconfig setup
mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "jsonls", "cssls", "html", "clangd", "gopls", "zls" },
  automatic_installation = true,
})

-- Get installed servers
local installed_servers = mason_lspconfig.get_installed_servers()

-- Setup other servers
for _, server_name in ipairs(installed_servers) do
  -- Skip Lua LS since we configured it separately
  if server_name ~= "lua_ls" then
    local config = {
      capabilities = capabilities,
      on_init = on_init
    }

    if server_configs[server_name] then
      config = vim.tbl_deep_extend("force", config, server_configs[server_name])
    end

    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
  end
end

-- Manual Nim configuration
vim.lsp.config('nim_langserver', {
  capabilities = capabilities,
  on_init = on_init,
  cmd = { "nimlangserver" },
  filetypes = { "nim", "nimrod" },
  settings = {
    nim = { nimsuggestPath = "/home/aliqyanabid/.nimble/bin/nimsuggest" }
  }
})
vim.lsp.enable('nim_langserver')

-- Disable notifications
vim.lsp.handlers["window/showMessage"] = function() end
vim.lsp.handlers["window/logMessage"] = function() end
vim.lsp.handlers["$/progress"] = function() end
