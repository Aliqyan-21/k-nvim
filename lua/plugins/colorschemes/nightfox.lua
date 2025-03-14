return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup {
      options = {
        transparent = true,     -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,   -- Non focused panes set to alternative background
        module_default = true,
      },
      inverse = {
        match_paren = true,
        visual = true,
        search = true,
      },
    }
    vim.cmd 'colorscheme terafox'
  end,
}
