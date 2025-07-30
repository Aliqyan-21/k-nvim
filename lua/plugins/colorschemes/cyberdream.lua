return {
  "scottmckendry/cyberdream.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup {
      transparent = true,
      -- Reduce the overall saturation of colours for a more muted look
      saturation = 0.3, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
      -- Enable italics comments
      italic_comments = true,
      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,
      -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
      borderless_pickers = true,
      -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
      cache = true,
    }
    vim.cmd 'colorscheme cyberdream'
  end,
}
