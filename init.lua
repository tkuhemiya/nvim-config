-- :require('mini.pick').setup()require('mini.pick').setup()tabnew, :tabclose, :tabnext -- for tabs


require('options')

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },

    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require('lsp')
require('plugin')
require('options')
require('keymap')
