return {
  {
    'aliqyan-21/darkvoid.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('darkvoid').setup {
        transparent = true,
        glow = false,
        colors = {
          line_nr = '#505050',
          comment = '#7393B3',
          bracket = '#F5DEB3',
          plugins = {
            nvim_cmp = false,
          },
        },
      }
      vim.cmd 'colorscheme darkvoid'
    end,
  },
}
