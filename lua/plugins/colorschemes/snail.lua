return {
  "snail.nvim",
  enabled = false,
  priority = 1000,
  lazy = false,
  config = function()
    require("snail").setup({
      turbo_snail = true,
      -- accents = {
      --   primary = "coral",
      --   secondary = "slate"
      -- },
    })
    vim.cmd.colorscheme('snail')
  end
}
