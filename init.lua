require('options')

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },

    { src = "https://github.com/Mofiqul/dracula.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
})

require('lsp')
require('plugin')
require('keymap')
require('autocmd')

require("dracula").setup({
  colors = {
    bg = "#131313",
  }
})
vim.cmd.colorscheme "dracula"
require('starter')
