local opt = vim.opt -- for conciseness

-- Don't redraw during macros/scripts
opt.lazyredraw = true
-- Faster terminal connection
opt.ttyfast = true

-- Make jumplist behave like a stack
opt.jumpoptions = 'stack'

-- wraps the search
opt.wrapscan = false

-- regex in search
opt.magic = true

opt.list = true
---@diagnostic disable-next-line
opt.listchars = {
  trail = ".",
  tab = "- ",
  nbsp = "⎵",
  extends = "❯",
  precedes = "❮",
  -- eol = "¬",
}

-- opt.guicursor = {
--   'n-v-c:block-blinkwait700-blinkoff400-blinkon250',     -- Normal, Visual, Command-line: blinking block
--   'i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250',   -- Insert modes: blinking vertical bar (25% width)
--   'r-cr:hor20-blinkwait700-blinkoff400-blinkon250',      -- Replace modes: blinking horizontal bar (20% height)
-- }

-- opt['guicursor'] = ""

opt.showmatch = true
opt.matchtime = 3

-- toggle statusline
-- opt.laststatus = 2 -- 0 and 2
opt.ruler = false

-- toggle show tabs on top
opt.showtabline = 0

-- toggle show modes in command line
opt.showmode = false

-- to make the lsp suggestion transparent
-- opt.pumblend = 30

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- appearance

-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = 'dark'

-- signcolumn config
opt.signcolumn = 'auto'
vim.cmd 'highlight clear SignColumn'

-- commandline height
opt.cmdheight = 1

-- Other Neovim configurations can follow
-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- turn off swapfile
opt.swapfile = false

-- turn spellcheck
-- opt.spelllang = en_us

-- scrolling
-- opt.scrolloff = 10

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
opt.number = true
opt.rnu = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
-- opt.scrolloff = 15

