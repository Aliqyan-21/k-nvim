return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require 'nvim-treesitter.configs'

    -- For custom parsers, you need to add the parser manually
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.seed7 = {
      install_info = {
        url = "/home/aliqyanabid/College/neovim/treesitter/tree-sitter-seed7",
        files = { "/home/aliqyanabid/College/neovim/treesitter/tree-sitter-seed7/src/parser.c" },
        branch = "main",
      },
      filetype = "seed7",
    }

    -- configure treesitter
    treesitter.setup {
      -- enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- enable indentation
      indent = { enable = false },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = false,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        'c',
        'cpp',
        'python',
        -- 'seed7', -- Your custom language
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }
  end,
}
