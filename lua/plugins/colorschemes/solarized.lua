return {
  "craftzdog/solarized-osaka.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("solarized-osaka").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        strings = {italic = true},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark",          -- style for sidebars, see below
        floats = "dark",            -- style for floating windows
      },
      sidebars = { "qf", "help" },  -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3,         -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    }
    vim.cmd 'colorscheme solarized-osaka'
  end
}
