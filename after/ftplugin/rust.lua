local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua require("tree_climber_rust").init_selection()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'x', '<C-s>', '<cmd>lua require("tree_climber_rust").select_incremental()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'x', '<C-S-s>', '<cmd>lua require("tree_climber_rust").select_previous()<CR>', opts)

vim.keymap.set('n', '<leader>a', function()
  vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set('n', '<leader>de', function()
  vim.cmd.RustLsp 'renderDiagnostic'
end, { silent = true, buffer = bufnr })
