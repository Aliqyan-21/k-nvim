return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black', 'isort' },
          javascript = { { 'prettierd', 'prettier' } },
          html = { 'prettier' },
          css = { 'prettier' },
          json = { 'prettier' },
        },
        format_on_save = {
          timeout_ms = 500,
          async = false,
        },
      }

      vim.keymap.set('n', '<leader>f', function()
        conform.format { async = true, lsp_fallback = true }
      end, { desc = 'Format file' })
    end,
  },
}
