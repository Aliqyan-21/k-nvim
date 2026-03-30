vim.pack.add({
  "https://github.com/NvChad/nvim-colorizer.lua",
  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/ThePrimeagen/harpoon",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",
  "https://github.com/onsails/lspkind.nvim",
  "https://github.com/nvimdev/lspsaga.nvim",
  "https://github.com/iamcco/markdown-preview.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/folke/neodev.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  -- theme
  "https://github.com/aliqyan-21/pomatia.nvim",
  -- "https://github.com/aliqyan-21/darkvoid.nvim",
})

local function load_plugin_configs()
  local dir = vim.fn.stdpath('config') .. '/lua/plugins'
  local handle = vim.loop.fs_scandir(dir)
  if not handle then return end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then break end

    -- skip init.lua
    if type == 'file' and name:match('%.lua$') and name ~= 'init.lua' then
      local module = 'plugins.' .. name:gsub('%.lua$', '')

      local ok, err = pcall(require, module)
      if not ok then
        vim.notify("Error loading " .. module .. ": " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

load_plugin_configs()

vim.cmd 'colorscheme pomatia'
