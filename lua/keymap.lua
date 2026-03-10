local map = vim.keymap.set

map('n', '<leader>w', '<Cmd>write<CR>')
map('n', '<leader>q', '<Cmd>quit<CR>')
map('n', '<leader>h', '<Cmd>Telescope help_tags<CR>')
map('n', '<leader>f', '<Cmd>Telescope find_files<CR>')
map('n', '<leader>g', '<Cmd>Telescope live_grep<CR>')
map('n', 'Q', '@@')

local neotree_initialized = false
local function ensure_neotree()
    if not neotree_initialized then
        local ok, neotree = pcall(require, 'neo-tree')
        if not ok then
            vim.notify('neo-tree.nvim is not available', vim.log.levels.ERROR)
            return false
        end

        neotree.setup({
            filesystem = {
                hijack_netrw_behavior = "disabled",
            },
        })
        neotree_initialized = true
    end

    return true
end

local function toggle_neotree()
    if not ensure_neotree() then
        return
    end

    vim.cmd('Neotree toggle')
end

map('n', '<C-d>', toggle_neotree, { desc = 'Toggle Neo-tree' })
map('n', '<C-h>', function()
    if not ensure_neotree() then
        return
    end
    vim.cmd('Neotree focus')
end, { desc = 'Focus Neo-tree' })
map('n', '-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
end, { desc = 'Open explorer at current file' })
map('n', '<leader>d', function()
    if not MiniFiles.close() then
        MiniFiles.open()
    end
end, { desc = 'Toggle MiniFiles explorer' })

map({ 'n', 'v' }, '<leader>z', '1z=', { silent = true })
map('n', 'U', '<C-r>')


map({ 'n', 'v', 'x' }, ';', ':')
map({ 'n', 'v' }, '<leader>n', ':norm ')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>p', '"+p')

map('n', '<leader>m', '<Cmd>Mason<CR>')
map('n', '<leader>li', '<Cmd>LspInfo<CR>')
map("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
map("n", "<leader>cw", '<Cmd>cd %:p:h<CR>', { desc = "Set cwd to current file" })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

map('n', '<Tab>', '<Cmd>bnext<CR>', { desc = 'Next Buffer' })
map('n', '<S-Tab>', '<Cmd>bprev<CR>', { desc = 'Prev Buffer' })
map('n', '<Leader><Tab>', '<Cmd>bdelete<CR>', { desc = 'Close Buffer' })

local flash = require('flash')
map({ 'n', 'x', 'o' }, '<leader>s', function()
    flash.jump()
end, { desc = 'Flash jump' })
