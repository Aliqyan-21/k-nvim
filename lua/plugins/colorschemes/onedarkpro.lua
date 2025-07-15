return {
  "olimorris/onedarkpro.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    require("onedarkpro").setup {
      options = {
        transparency = true,
      },
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "italic",
        comments = "italic",
        keywords = "bold",
        constants = "NONE",
        functions = "NONE",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "NONE",
        virtual_text = "NONE",
      },
      highlights = {
        DiagnosticUnderlineError = { underline = true, undercurl = false },
        DiagnosticUnderlineWarn = { underline = true, undercurl = false },
        DiagnosticUnderlineInfo = { underline = true, undercurl = false },
        DiagnosticUnderlineHint = { underline = true, undercurl = false },
      },
    }
    vim.cmd 'colorscheme onedark_dark'
  end
}
