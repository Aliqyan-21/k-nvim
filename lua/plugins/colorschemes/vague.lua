return {
  "vague2k/vague.nvim",
  enabled = true,
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    require("vague").setup {
      transparent = true, -- don't set background
      -- disable bold/italic globally in `style`
      bold = true,
      italic = true,
      style = {
        -- "none" is the same thing as default. But "italic" and "bold" are also valid options
        boolean = "bold",
        number = "none",
        float = "none",
        error = "bold",
        comments = "italic",
        conditionals = "none",
        functions = "none",
        headings = "bold",
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
        builtin_constants = "bold",
        builtin_functions = "none",
        builtin_types = "bold",
        builtin_variables = "none",
      }
    }
    vim.cmd 'colorscheme vague'
  end
}
