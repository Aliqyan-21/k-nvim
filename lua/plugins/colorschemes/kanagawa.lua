return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup {
      compile = true,    -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls

      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = false },

      overrides = function(colors)
        local theme = colors.theme

        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end

        return {
          -- string italic
          String                 = { italic = true },

          -- pop up menu
          Pmenu                  = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel               = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar              = { bg = theme.ui.bg_m1 },
          PmenuThumb             = { bg = theme.ui.bg_p2 },

          -- look nicer
          NormalFloat            = { bg = "none" },
          FloatBorder            = { bg = "none" },
          FloatTitle             = { bg = "none" },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal             = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal            = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- better telescope
          TelescopeTitle         = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal  = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder  = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
      end,

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },

      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      background = {         -- map the value of 'background' option to a theme
        dark = "dragon",     -- try "dragon" !
      },
    }
    vim.cmd 'colorscheme kanagawa'
  end
}
