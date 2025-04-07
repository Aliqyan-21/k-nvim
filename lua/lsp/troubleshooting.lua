-- LSP troubleshooting utilities

-- Function to reload all LSP configurations
local function reload_lsp()
  -- Restart all active clients
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    client.stop()
  end
  
  -- Clear and reload modules
  for name, _ in pairs(package.loaded) do
    if name:match("^lsp%.") then
      package.loaded[name] = nil
    end
  end
  
  -- Reload LSP config
  require("lsp")
  
  -- Inform user
  vim.notify("LSP configurations reloaded", vim.log.levels.INFO)
end

-- Register the command
vim.api.nvim_create_user_command("ReloadLSP", reload_lsp, {})

-- Function to show detailed LSP logs
local function enable_lsp_logging()
  vim.lsp.set_log_level("debug")
  vim.notify("LSP logging set to debug level", vim.log.levels.INFO)
  vim.cmd("edit " .. vim.lsp.get_log_path())
end

-- Register the command
vim.api.nvim_create_user_command("EnableLSPLogging", enable_lsp_logging, {})
