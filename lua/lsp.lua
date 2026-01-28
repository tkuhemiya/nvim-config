local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  end,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
  filetypes = {
    'javascript', 'javascriptreact', 'javascript.jsx',
    'typescript', 'typescriptreact', 'typescript.tsx'
  },
  init_options = {
    preferences = {
      disableSuggestions = false,
      importModuleSpecifierPreference = 'shortest',
      quotePreference = 'auto',
    },
  },
  root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),
})


