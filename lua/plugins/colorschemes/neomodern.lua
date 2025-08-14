return {
  "cdmill/neomodern.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("neomodern").setup({
      -- Can be one of: 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
      theme = "gyokuro",
      -- Can be one of: 'light' | 'dark', or set via vim.o.background
      variant = "dark",
      -- Use an alternate, darker bg
      alt_bg = true,
      -- If true, docstrings will be highlighted like strings, otherwise they will be
      -- highlighted like comments. Note, behavior is dependent on the language server.
      colored_docstrings = true,
      -- If true, highlights the {sign,fold} column the same as cursorline
      cursorline_gutter = true,
      -- If true, highlights the gutter darker than the bg
      dark_gutter = false,
      -- if true favor treesitter highlights over semantic highlights
      favor_treesitter_hl = true,
      -- Don't set background of floating windows. Recommended for when using floating
      -- windows with borders.
      plain_float = true,
      -- Show the end-of-buffer character
      show_eob = true,
      -- If true, enable the vim terminal colors
      term_colors = true,
      -- Don't set background
      transparent = true,

      -----DIAGNOSTICS and CODE STYLE-----
      --
      diagnostics = {
        darker = true, -- Darker colors for diagnostic
        undercurl = false, -- Use undercurl for diagnostics
        background = false, -- Use background color for virtual text
      },
      -- The following table accepts values the same as the `gui` option for normal
      -- highlights. For example, `bold`, `italic`, `underline`, `none`.
      code_style = {
        comments = "italic",
        conditionals = "none",
        functions = "none",
        keywords = "none",
        headings = "bold", -- Markdown headings
        operators = "none",
        keyword_return = "none",
        strings = "italic",
        variables = "none",
      },
    })
    require("neomodern").load()
  end,
}
