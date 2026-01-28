-- :tabnew, :tabclose, :tabnext -- for tabs


require('options')

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls' },
})

require('mini.completion').setup({
  window = {
    info = { border = 'single' },
    signature = { border = 'single' },
  },
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = true,
  },
})

capabilities = vim.lsp.protocol.make_client_capabilities(),


require('lsp')
require('keymap')
