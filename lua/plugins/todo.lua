require("todo-comments").setup({
  signs = false,     -- show icons in the signs column
  sign_priority = 8, -- sign priority
  keywords = {
    FIX = {
      icon = " ", 
      color = "#ff6b6b", -- bright red for urgent fixes
      alt = { "FIXME", "fix", "FIX",  "BUG", "FIXIT", "ISSUE", "fixme", "bug", "issue" },
    },
    TODO = {
      icon = " ",
      color = "#4ecdc4", -- bright teal for todos
      alt = { "todo" },
    },
    HACK = {
      icon = " ",
      color = "#ff9ff3", -- bright magenta for hacks
      alt = { "hack" },
    },
    WARN = {
      icon = " ",
      color = "#feca57", -- bright yellow for warnings
      alt = { "WARNING", "XXX" },
    },
    PERF = { icon = " ", color = "#a29bfe", alt = { "PERFORMANCE", "PERF", "perf" } }, 
    NOTE = { icon = " ", color = "#74b9ff", alt = { "INFO", "info", "note", "NOTE" } },
    TEST = { icon = "⏲ ", color = "#fd79a8", alt = { "TEST", "test" } },
  },
  gui_style = {
    fg = "NONE",         -- The gui style to use for the fg highlight group.
    bg = "BOLD",         -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
})
