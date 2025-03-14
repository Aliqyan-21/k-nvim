-- Plugin manager setup (lazy.nvim)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Function to recursively find plugin files
local function load_plugin_files(directory)
  local plugins = {}
  local lua_files = vim.fn.globpath(directory, '**/*.lua', false, true)

  for _, file in ipairs(lua_files) do
    if not file:match('/init.lua$') then
      local module_path = file:gsub(vim.fn.stdpath('config') .. '/lua/', ''):gsub('%.lua$', ''):gsub('/', '.')
      local success, plugin_spec = pcall(require, module_path)
      if success and type(plugin_spec) == 'table' then
        table.insert(plugins, plugin_spec)
      else
        print("Warning: Plugin file " .. file .. " could not be loaded or did not return a table")
      end
    end
  end

  return plugins
end

-- Load all plugins from lua/plugins/ and subdirectories
local plugins = load_plugin_files(vim.fn.stdpath('config') .. '/lua/plugins')

require('lazy').setup(plugins)
