return {
  'EdenEast/nightfox.nvim',
  enabled = false,
  config = function()
    require('nightfox').setup {
      options = {
        -- Compiled file's destination location
        transparent = true,     -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,   -- Non focused panes set to alternative background
        module_default = true,  -- Default enable value for modules

        styles = {              -- Style to be applied to different syntax groups
          comments = 'italic',  -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'italic',
          types = 'NONE',
          variables = 'NONE',
        },

        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
      },
    }
    vim.cmd 'colorscheme terafox'
  end,
}
