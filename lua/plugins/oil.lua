return {
  'stevearc/oil.nvim',
  lazy = true,
  init = function()
    require('oil').setup {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
    }
  end,
}
