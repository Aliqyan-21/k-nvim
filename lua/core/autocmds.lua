-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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

-- Set wrapping and spell checking for text files
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Settings for text file types',
  group = vim.api.nvim_create_augroup('text_file_settings', { clear = true }),
  pattern = { 'markdown', 'text', 'tex', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Enhanced TODO comment highlighting
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  desc = 'Enhanced TODO comment highlighting',
  group = vim.api.nvim_create_augroup('enhanced_todo_highlights', { clear = true }),
  callback = function()
    -- Define highlight groups with custom colors
    vim.cmd [[
      highlight TodoComment guifg=#000000 guibg=#fff0ab gui=bold
      highlight FixmeComment guifg=#000000 guibg=#F5BE9A gui=bold
      highlight BugComment guifg=#000000 guibg=#F9665E gui=bold
      highlight NoteComment guifg=#000000 guibg=#A9CBD7 gui=bold
      highlight HackComment guifg=#000000 guibg=#D3F4A9 gui=bold
      highlight PerformanceComment guifg=#000000 guibg=#DCB5CB gui=bold
    ]]

    -- Match patterns including trailing context
    vim.fn.matchadd('TodoComment', '\\<TODO\\>.*$')
    vim.fn.matchadd('FixmeComment', '\\<FIXME\\>.*$')
    vim.fn.matchadd('BugComment', '\\<BUG\\>.*$')
    vim.fn.matchadd('NoteComment', '\\<NOTE\\>.*$')
    vim.fn.matchadd('HackComment', '\\<HACK\\>.*$')
    vim.fn.matchadd('PerformanceComment', '\\<PERF\\>.*$')

    -- Also match comments with colons
    vim.fn.matchadd('TodoComment', '\\<TODO:\\>.*$')
    vim.fn.matchadd('FixmeComment', '\\<FIXME:\\>.*$')
    vim.fn.matchadd('BugComment', '\\<BUG:\\>.*$')
    vim.fn.matchadd('NoteComment', '\\<NOTE:\\>.*$')
    vim.fn.matchadd('HackComment', '\\<HACK:\\>.*$')
    vim.fn.matchadd('PerformanceComment', '\\<PERF:\\>.*$')

    -- Match lowercase variants as well
    vim.fn.matchadd('TodoComment', '\\<todo\\>.*$')
    vim.fn.matchadd('FixmeComment', '\\<fixme\\>.*$')
    vim.fn.matchadd('BugComment', '\\<bug\\>.*$')
    vim.fn.matchadd('NoteComment', '\\<note\\>.*$')
    vim.fn.matchadd('HackComment', '\\<hack\\>.*$')
    vim.fn.matchadd('PerformanceComment', '\\<perf\\>.*$')
  end,
})
