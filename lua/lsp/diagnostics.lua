vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
  signs = false, -- Disable signs in the gutter
  -- virtual_text = {
  --   severity = {
  --     max = vim.diagnostic.severity.WARN,
  --   },
  -- },
  -- virtual_lines = {
  --   severity = {
  --     min = vim.diagnostic.severity.ERROR,
  --   },
  -- },
})
