vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'markdown-preview.nvim' and (ev.data.kind == 'install' or ev.data.kind == 'update') then
      vim.fn['mkdp#util#install']()
    end
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  once = true,
  callback = function()
    vim.cmd.packadd('markdown-preview.nvim')
  end
})

vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Markdown Preview' })
