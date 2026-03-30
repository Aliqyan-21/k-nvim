local configs = require('nvim-treesitter')

configs.setup({
  ensure_installed = {
    'c',
    'cpp',
    'python',
    'lua',
    'vim',
    'vimdoc',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
  autotag = { enable = false },
})
