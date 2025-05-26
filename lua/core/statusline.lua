local M = {}

-- =====================
-- 1. HIGHLIGHTS
-- =====================
function M.setup_highlights()
  -- Base statusline colors
  vim.api.nvim_set_hl(0, "Statusline", { bg = "NONE", fg = "#787276" })
  vim.api.nvim_set_hl(0, "StatuslineNC", { bg = "NONE", fg = "#787276" })
  vim.api.nvim_set_hl(0, "StatuslineLeft", { bg = "NONE", fg = "#787276" })
  vim.api.nvim_set_hl(0, "StatuslineRight", { bg = "NONE", fg = "#787276" })
  vim.api.nvim_set_hl(0, "StatuslineMiddle", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "StatuslineModified", { bg = "NONE", fg = "#D19A66" })

  -- LSP diagnostics
  vim.api.nvim_set_hl(0, "LspError", { bg = "NONE", fg = "#D16969" })
  vim.api.nvim_set_hl(0, "LspWarning", { bg = "NONE", fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "LspInfo", { bg = "NONE", fg = "#569CD6" })           -- Info (optional)

  -- Mode colors
  vim.api.nvim_set_hl(0, "ModeN", { bg = "NONE", fg = "#569CD6" }) -- Normal
  vim.api.nvim_set_hl(0, "ModeI", { bg = "NONE", fg = "#6A9955" }) -- Insert
  vim.api.nvim_set_hl(0, "ModeV", { bg = "NONE", fg = "#C586C0" }) -- Visual
  vim.api.nvim_set_hl(0, "ModeC", { bg = "NONE", fg = "#DCDCAA" }) -- Command
end

-- =====================
-- 2. UTILITY FUNCTIONS
-- =====================
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode:sub(1, 1) -- First char (n/i/v/c)
  return string.format("%%#Mode%s#  %%*", current_mode:upper())
end

local function git_branch()
  local branch = vim.b.gitsigns_head or ""
  return branch ~= "" and string.format("  %s ", branch) or ""
end

local function file_info()
  local filename = vim.fn.expand("%:t") -- Only filename, no path
  if filename == "" then return "[No Name]" end
  return filename
end

local function lsp_diagnostics()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }) -- Optional
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })  -- Optional

  local diag = {}
  if errors > 0 then table.insert(diag, string.format("%%#LspError# %d ", errors)) end
  if warnings > 0 then table.insert(diag, string.format("%%#LspWarning# %d ", warnings)) end
  if hints > 0 then table.insert(diag, string.format("%%#LspInfo# %d ", hints)) end
  if info > 0 then table.insert(diag, string.format("%%#LspInfo# %d ", info)) end

  return table.concat(diag)
end

local function position()
  local line = vim.fn.line(".")
  local total = vim.fn.line("$")
  return string.format(" [%d/%d] ", line, total)
end

-- =====================
-- 3. STATUSLINE BUILD
-- =====================
function M.line()
  return table.concat({
    "%#StatuslineLeft#",
    mode(),
    git_branch(),
    vim.bo.modified and "%#StatuslineModified#  %*" or "",
    "%#StatuslineMiddle#%=",
    lsp_diagnostics(),
    "%#StatuslineRight#",
    file_info(),
    position(),
  })
end

-- =====================
-- 4. INITIALIZATION
-- =====================
M.setup_highlights()
vim.opt.statusline = "%!v:lua.require'core.statusline'.line()"
vim.opt.laststatus = 3   -- Global statusline
vim.opt.showmode = false -- Hide default mode text

-- Refresh on critical events
vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter", "ModeChanged", "DiagnosticChanged" }, {
  callback = function()
    M.setup_highlights()
    vim.opt.statusline = "%!v:lua.require'core.statusline'.line()"
  end,
})

return M
