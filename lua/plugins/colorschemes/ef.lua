return {
  'oonamo/ef-themes.nvim',
  -- priority = 1000,
  config = function()
    require('ef-themes').setup {
      dark = 'ef-deuteranopia-dark', -- night, maris-dark, bio
      transparent = false,
    }
    -- vim.cmd.colorscheme 'ef-theme'
  end,
}
