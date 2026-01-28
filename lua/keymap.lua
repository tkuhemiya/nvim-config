local map = vim.keymap.set

vim.g.mapleader = " "

map('n', '<leader>w', '<Cmd>write<CR>')
map('i', 'jk', '')
map('n', '<leader>q', '<Cmd>:quit<CR>')
map('n', '<leader>op', '<Cmd>:!open ./<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>f', ':Pick files tool="git"<CR>')
map('n', 'Q', '@@')

map({ 'n', 'v' }, '<leader>z', '1z=', { silent = true })
map('n', 'U', '<C-r>')


map({ 'n', 'v', 'x' }, ';', ':')
map({ 'n', 'v' }, '<leader>n', ':norm ')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>p', '"+p')

map('n', '<leader>m', '<Cmd>:Mason<CR>')
map('n', '<leader>li', ':LspInfo<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

vim.keymap.set('i', '<C-Space>', function() require('mini.completion').complete() end, {})
vim.keymap.set('i', '<Tab>', function() require('mini.completion').complete() end, {})

