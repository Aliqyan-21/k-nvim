return ({
  "ramojus/mellifluous.nvim",
  enabled = true,
  priority = 1000,
  config = function()
    require("mellifluous").setup({
      colorset = "tender",
      styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        main_keywords = {},
        other_keywords = {},
        types = {},
        operators = {},
        strings = { italic = true },
        functions = {},
        constants = {},
        comments = { italic = true },
        markup = {
          headings = { bold = true },
        },
        folds = {},
      },
      transparent_background = {
        enabled = true,
        floating_windows = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
      },
    })
    vim.cmd("colorscheme mellifluous")
  end,
})
