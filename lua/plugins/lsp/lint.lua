return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        python = { 'pylint' },
        javascript = { 'eslint_d' },
        json = { 'jsonlint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'TextChanged' }, {
        group = vim.api.nvim_create_augroup('Linting', { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger linting' })
    end,
  },
}
