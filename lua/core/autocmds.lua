-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Return to last edit position when opening files',
  group = vim.api.nvim_create_augroup('last_edit_position', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- -- Set spell checking for text files
-- vim.api.nvim_create_autocmd('FileType', {
--   desc = 'Settings for text file types',
--   group = vim.api.nvim_create_augroup('text_file_settings', { clear = true }),
--   pattern = { 'markdown', 'text', 'tex', 'gitcommit' },
--   callback = function()
--     vim.opt_local.spell = true
--   end,
-- })

-- trailing whitespace remove in whole file
vim.keymap.set('n', '<Leader>wns', function()
  vim.cmd [[%s/\s\+$//e]]
end, { desc = 'Trim trailing whitespace' })

vim.cmd [[autocmd BufRead,BufNewFile *.sd7 set filetype=seed7]]
