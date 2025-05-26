-- Function to set key mappings when a language server attaches
local function setup_keymaps(client, bufnr)
  -- Helper for setting keymaps
  local map = function(mode, key, action, desc)
    local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, key, action, opts)
  end

  -- Navigation
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gr", vim.lsp.buf.references, "Go to references")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

  -- Diagnostics
  map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show diagnostics for file")
  map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostics for line")
  map("n", "<leader>q", vim.diagnostic.setloclist, "Set location list")

  -- Documentation and help
  map("n", "K", vim.lsp.buf.hover, "Show hover documentation")
  map("n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help")

  -- Workspace management
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")

  -- Refactoring
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("v", "<leader>ca", vim.lsp.buf.code_action, "Range code action")

  -- Formatting
  map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, "Format document")

  -- LSP info
  map("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP info")
  map("n", "<leader>lr", "<cmd>LspRestart<cr>", "Restart LSP")

  -- If telescope is installed, use it for certain LSP features
  if package.loaded["telescope"] then
    local telescope = require("telescope.builtin")
    -- map("n", "gr", telescope.lsp_references, "Find references (Telescope)")
    map("n", "<leader>ds", telescope.lsp_document_symbols, "Document symbols")
    map("n", "<leader>ws", telescope.lsp_workspace_symbols, "Workspace symbols")
  end
end

-- Setup LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(event)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Set up buffer-local mappings
    setup_keymaps(event.data.client_id, event.buf)
  end,
})
