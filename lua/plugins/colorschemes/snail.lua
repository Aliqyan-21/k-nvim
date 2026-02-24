return {
  "snail.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("snail").setup({
      -- Optional overrides
      palette = {
        -- e.g., blue = "#newcolor",
      }
    })
    vim.cmd.colorscheme("snail")
  end,
}
