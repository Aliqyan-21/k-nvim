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

vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
      id = 'lsp_progress',
      title = 'LSP Working...',
      icon = spinner[math.floor(vim.uv.hrtime() / 1e8) % #spinner + 1],
    })
  end,
})
