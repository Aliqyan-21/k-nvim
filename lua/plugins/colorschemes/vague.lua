return {
  "vague2k/vague.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = true, -- don't set background
      style = {
        -- "none" is the same thing as default. But "italic" and "bold" are also valid options
        boolean = "none",
        number = "none",
        float = "none",
        error = "none",
        comments = "italic",
        conditionals = "none",
        functions = "none",
        headings = "none",
        operators = "none",
        strings = "italic",
        variables = "none",

        -- keywords
        keywords = "none",
        keyword_return = "none",
        keywords_loop = "none",
        keywords_label = "none",
        keywords_exception = "none",

        -- builtin
        builtin_constants = "none",
        builtin_functions = "none",
        builtin_types = "none",
        builtin_variables = "none",
      },
      -- plugin styles where applicable
      -- make an issue/pr if you'd like to see more styling options!
      plugins = {
        cmp = {
          match = "none",
          match_fuzzy = "none",
        },
        dashboard = {
          footer = "italic",
        },
        lsp = {
          diagnostic_error = "none",
          diagnostic_hint = "none",
          diagnostic_info = "none",
          diagnostic_warn = "none",
        },
        telescope = {
          match = "none",
        },
      },
    })
    vim.cmd 'colorscheme vague'
  end
}
