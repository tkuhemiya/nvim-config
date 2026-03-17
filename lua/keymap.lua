local map = vim.keymap.set

local function search_visual_selection()
    local start_pos = vim.fn.getpos('v')
    local end_pos = vim.fn.getpos('.')
    local start_row, start_col = start_pos[2], start_pos[3]
    local end_row, end_col = end_pos[2], end_pos[3]

    if start_row > end_row or (start_row == end_row and start_col > end_col) then
        start_row, end_row = end_row, start_row
        start_col, end_col = end_col, start_col
    end

    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})
    local text = table.concat(lines, '\n')
    if text == '' then
        return
    end

    local pattern = vim.fn.escape(text, [[\/]])
    pattern = pattern:gsub('\n', [[\n]])
    vim.fn.feedkeys('/' .. pattern, 'n')
end

map('n', '<leader>w', '<Cmd>write<CR>')
map('n', '<leader>q', '<Cmd>quit<CR>')
map('n', '<leader>h', '<Cmd>Telescope help_tags<CR>')
map('n', '<leader>f', '<Cmd>Telescope find_files<CR>')
map('n', '<leader>g', '<Cmd>Telescope live_grep<CR>')
map('n', 'Q', '@@')

map('n', '-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
end, { desc = 'Open explorer at current file' })
map('n', '<leader>d', function()
    if not MiniFiles.close() then
        MiniFiles.open()
    end
end, { desc = 'Toggle MiniFiles explorer' })

map('n', '<leader>z', 'za', { desc = 'Toggle fold' })
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
map('x', '/', search_visual_selection, { desc = 'Search visual selection' })

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
