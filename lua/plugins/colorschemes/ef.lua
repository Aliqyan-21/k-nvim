return {
  'oonamo/ef-themes.nvim',
  enabled = true,
  priority = 1000,
  config = function()
    require('ef-themes').setup {
      dark = 'ef-dream', -- night, maris-dark, bio
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { bold = false },
        functions = {},
        variables = {},
        classes = { bold = false },
        types = { bold = false },
      },
    }
    vim.cmd.colorscheme 'ef-theme'
    vim.api.nvim_set_hl(0, '@string', { italic = true })
  end,
}
