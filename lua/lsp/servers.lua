-- Configure LSP servers and their settings

-- Set up neodev for better Lua development experience (must be set up before lspconfig)
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Get capabilities from cmp_nvim_lsp for better completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Common on_init function to set offset encoding
local on_init = function(client)
  client.offset_encoding = 'utf-8'
end

-- Mason LSP setup
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- List of language servers to install and configure
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls", -- Lua
    "jsonls", -- JSON
    "cssls",  -- CSS
    "html",   -- HTML
    "clangd", -- C/C++
    "gopls",  -- Go
    -- "nim_langserver",  -- manually
  },
  automatic_installation = true,
})

-- Setup all installed servers
mason_lspconfig.setup_handlers({
  -- Default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_init = on_init, -- Set the offset encoding for all servers
    })
  end,

  -- Custom server configurations
  -- Lua specific configuration
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
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
    })
  end,

  -- JSON with schema support
  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_init = on_init,
      settings = {
        json = {
          validate = { enable = true },
        },
      },
    })
  end,

  ["nim_langserver"] = function()
    lspconfig.nim_langserver.setup({
      capabilities = capabilities,
      on_init = on_init,
      cmd = { "nimlangserver" },
      filetypes = { "nim", "nimrod" },
      settings = {
        nim = {
          nimsuggestPath = "/home/aliqyanabid/.nimble/bin/nimsuggest",
        },
      },
    })
  end,
})

-- for those creepy logs of lsp
vim.lsp.handlers["window/showMessage"] = function() end
vim.lsp.handlers["window/logMessage"] = function() end
vim.lsp.handlers["$/progress"] = function() end  -- Disable progress notifications
