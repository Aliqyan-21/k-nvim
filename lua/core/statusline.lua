-- Add this at the VERY TOP of your statusline.lua (before any highlights)
vim.cmd([[
  augroup TransparentStatusline
    autocmd!
    autocmd ColorScheme * lua require('core.statusline').setup_highlights()
  augroup END
]])

local M = {}

function M.setup_highlights()
  vim.cmd([[
    " Clear all statusline highlights first
    hi clear Statusline
    hi clear StatuslineNC

    " Transparent statusline with subtle text
    hi! Statusline          guibg=NONE guifg=#787276
    hi! StatuslineNC        guibg=NONE guifg=#787276
    hi! StatuslineLeft      guibg=NONE guifg=#787276
    hi! StatuslineRight     guibg=NONE guifg=#787276
    hi! StatuslineMiddle    guibg=NONE guifg=NONE
    hi! StatuslineModified  guibg=NONE guifg=#D19A66

    " Mode-specific highlights
    hi! ModeN guibg=NONE guifg=#569CD6
    hi! ModeI guibg=NONE guifg=#6A9955
    hi! ModeV guibg=NONE guifg=#C586C0
    hi! ModeC guibg=NONE guifg=#DCDCAA
    hi! ModeR guibg=NONE guifg=#D16969
    hi! ModeT guibg=NONE guifg=#4EC9B0
    hi! GitBranch guibg=NONE guifg=#E5C07B
  ]])
end

M.setup_highlights()

local function mode()
  local modes = {
    n = "",
    i = "",
    v = "",
    V = "󰬃",
    [""] = " ",
    c = "",
    R = "󰬙",
    t = "󰬁",
  }
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%%#Mode%s# %s %%*", current_mode:upper(), modes[current_mode] or "UNKNOWN")
end

-- Add mode-specific highlights (transparent background)
vim.cmd([[
  hi ModeN guibg=NONE guifg=#569CD6
  hi ModeI guibg=NONE guifg=#6A9955
  hi ModeV guibg=NONE guifg=#C586C0
  hi ModeC guibg=NONE guifg=#DCDCAA
  hi ModeR guibg=NONE guifg=#D16969
  hi ModeT guibg=NONE guifg=#4EC9B0
]])

local function get_git_branch()
  local branch = vim.b.gitsigns_head
  if branch == nil or branch == "" then
    return ""
  end
  return branch
end

local function git_branch()
  local branch = get_git_branch()
  if branch == "" then
    return ""
  end
  return string.format(" %%#GitBranch# %s %%*", branch)
end

-- Add git branch highlight
vim.cmd([[
  hi GitBranch guibg=NONE guifg=#E5C07B
]])

local function file_info()
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end

  local line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")

  local position
  if line == 1 then
    position = "[Top]"
  elseif line == total_lines then
    position = "[Bot]"
  else
    position = string.format("[%d/%d]", line, total_lines)
  end

  return position
end

local function left_island()
  return table.concat({
    "%#StatuslineLeft#",
    mode(),
    git_branch(),
    "%#StatuslineModified#", -- Modified indicator
    "%m",
  })
end

local function right_island()
  return table.concat({
    "%#StatuslineRight#",
    "%f ",
    file_info(),
  })
end

function Statusline()
  return table.concat({
    "%#StatuslineLeft#",
    left_island(),
    "%#StatuslineMiddle#", -- Middle separator with transparency
    "%=",
    right_island(),
  })
end

function M.line()
  return table.concat({
    "%#StatuslineLeft#",
    left_island(),
    "%#StatuslineMiddle#",
    "%=",
    right_island(),
  })
end

-- Set the statusline
vim.opt.statusline = "%!v:lua.require'core.statusline'.line()"
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Refresh on events
vim.cmd([[
  augroup UpdateStatusline
    autocmd!
    autocmd BufEnter,ModeChanged,ColorScheme * lua vim.opt.statusline = "%!v:lua.require'core.statusline'.line()"
  augroup END
]])

return M
