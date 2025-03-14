local opt = vim.opt -- for conciseness

vim.opt.guicursor = {
  'n-v-c:block-blinkwait700-blinkoff400-blinkon250', -- Normal, Visual, Command-line mode with blinking block cursor
  'i-ci-ve:block-blinkwait700-blinkoff400-blinkon250', -- Insert, Replace mode with blinking vertical bar cursor
  'r-cr:block-blinkwait700-blinkoff400-blinkon250', -- Replace mode with blinking horizontal cursor
}

-- toggle statusline
vim.opt.laststatus = 2 -- 0 and 2
vim.opt.ruler = false

-- toggle show tabs on top
vim.opt.showtabline = 0

-- toggle show modes in command line
vim.opt.showmode = false

-- to make the lsp suggestion transparent
-- vim.opt.pumblend = 30

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
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

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- turn spellcheck
-- opt.spelllang = en_us

-- scrolling
opt.scrolloff = 10

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.rnu = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'no'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15
