return {
  "ficcdaf/ashen.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require('ashen').setup {
      transparent = true,
      style_presets = {
        bold_functions = false,
        italic_comments = true,
      },
    }
    vim.cmd 'colorscheme ashen'
  end
}
