return {
  "ficcdaf/ashen.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("ashen").setup {
      style_presets = {
        bold_functions = false,
        italic_comments = true,
      },
      --- override palette colors
      colors = {},
      -- override highlight groups
      hl = {
        ---Overwrite; omitted fields are cleared
        force_override = {},
        ---Merge fields with defaults
        merge_override = {
        },
        ---Link Highlight1 -> Highlight2
        ---Overrides all default links
        link = {},
      },
      -- use transparent background
      -- (requires terminal support)
      transparent = false,
      -- force clear other highlights
      -- even if no other theme is set
      force_hi_clear = false,
      -- set built-in terminal colors
      terminal = {
        -- if disabled, Neovim terminal will
        -- use your terminal emulator's theme
        enabled = true,
        ---override terminal palette
        colors = {},
      },
      -- configure plugin integrations
      plugins = {
        -- automatically load plugin integrations
        autoload = true,
        ---if autoload: plugins to SKIP
        ---if not autoload: plugins to LOAD
        override = {},
      },
    }
    vim.cmd 'colorscheme ashen'
  end
}
