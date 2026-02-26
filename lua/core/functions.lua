-- strip all highlighting
local function let_there_be_void()
  vim.cmd('syntax off')
  local ts_ok, _ = pcall(require, 'nvim-treesitter.configs')
  if ts_ok then
    vim.cmd('TSBufDisable highlight')
  end
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    vim.lsp.semantic_tokens.stop(0, client.id)
  end
  print("Highlighting disabled.")
end

-- restore all highlighting
local function let_there_be_light()
  vim.cmd('syntax on')
  local ts_ok, _ = pcall(require, 'nvim-treesitter.configs')
  if ts_ok then
    vim.cmd('TSBufEnable highlight')
  end
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    vim.lsp.semantic_tokens.start(0, client.id)
  end
  print("Highlighting restored.")
end

vim.api.nvim_create_user_command('LetThereBeVoid', let_there_be_void, {})
vim.api.nvim_create_user_command('LetThereBeLight', let_there_be_light, {})
