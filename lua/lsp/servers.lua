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
    "lua_ls",  -- Lua
    -- "rust_analyzer", -- Rust
    "jsonls",  -- JSON
    "cssls",   -- CSS
    "html",    -- HTML
    "clangd",  -- C/C++
    "gopls",   -- Go
  },
  automatic_installation = true,
})

-- Setup all installed servers
mason_lspconfig.setup_handlers({
  -- Default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,

  -- Custom server configurations
  -- Lua specific configuration
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
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
      settings = {
        json = {
          validate = { enable = true },
        },
      },
    })
  end,

  -- Rust with specific settings
  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
          procMacro = {
            enable = true,
          },
        },
      },
    })
  end,
})
