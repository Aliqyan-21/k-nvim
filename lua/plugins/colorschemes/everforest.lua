return {
  'neanias/everforest-nvim',
  enabled = false,
  version = false,
  lazy = false,
  config = function()
    require('everforest').setup {
      background = 'hard',
      transparent_background_level = 2,
      on_highlights = function(hl, palette)
        hl.TSString = { fg = palette.aqua, bg = palette.none, italic = true }
      end,
    }
    vim.cmd 'colorscheme everforest'
  end,
}
