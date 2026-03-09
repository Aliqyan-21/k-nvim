return {
  "aliqyan-21/pomatia.nvim",
  enabled = true,
  priority = 1000,
  config = function()
    require('pomatia').setup {
      transparent = true,
    }
    vim.cmd 'colorscheme pomatia'
  end
}
