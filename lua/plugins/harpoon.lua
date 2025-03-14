return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local kp = vim.keymap
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    kp.set("n", "<leader>a", mark.add_file)
    kp.set("n", "<leader>ae", ui.toggle_quick_menu)

    kp.set("n", "<tab>", function()
      ui.nav_next()
    end)

    kp.set("n", "<S-tab>", function()
      ui.nav_prev()
    end)
  end,
}
