return {
  "loctvl842/monokai-pro.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup {
      transparent_background = true,
      styles = {
        comment = { italic = true },
      },
      filter = "pro",
    }
    vim.cmd 'colorscheme monokai-pro'
  end
}
