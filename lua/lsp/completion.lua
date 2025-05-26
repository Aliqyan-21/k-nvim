-- Configure autocompletion

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  -- Configure snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
    }),
  },

  -- Map keys for completion
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

    -- Scroll docs up/down
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-b>"] = cmp.mapping.scroll_docs(4),

    -- Invoke completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Abort completion
    ["<C-e>"] = cmp.mapping.abort(),

    -- Accept completion (with different behaviors based on selection)
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),

  -- Define completion sources and their priority
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip",  priority = 750 },
    { name = "buffer",   priority = 500 },
    { name = "path",     priority = 250 },
  }),

  -- Configure completion item formatting
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[Path]",
      },
    }),
  },

  -- Configure experimental features
  experimental = {
    ghost_text = false,
  },
})

-- Setup completion for specific filetypes: command line
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  }),
  completion = {
    autocomplete = false,
  }
})

-- Setup completion for search
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
