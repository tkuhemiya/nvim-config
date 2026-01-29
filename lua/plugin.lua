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

require('mini.cmdline').setup({
    window = {
        config = function()
            local height = vim.o.lines
            local width = vim.o.columns
            return {
                anchor = 'NW',
                height = 1,
                width = math.floor(width * 0.6),
                row = math.floor(height * 0.4), -- 40% down from the top
                col = math.floor(width * 0.2),  -- 20% in from the left
                border = 'rounded',
            }
        end,
    },
    autopeek = {
        enable = true,
        n_context = 1,
        predicate = nil,
    },
})

require('mini.diff').setup()
-- :h MiniDiff-overview
-- :h MiniDiff-source-specification
-- :h MiniDiff-hunk-specification
-- :h MiniDiff-diff-summary

require('mini.files').setup({
    content = {
        filter = function(entry)
            return entry.name ~= '.git' and entry.name ~= 'node_modules'
        end,
    },
    mappings = {
        synchronize = '=',
        go_in       = 'l',
        go_in_plus  = '<CR>',
    },
    windows = {
        -- max_number = math.huge,
        preview = false,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 25,
    },
})

require('mini.pick').setup()

local starter = require('mini.starter')
starter.setup({
    -- set_vim_settings = true, -- Auto-sets 'showtabline' to 2
    -- tabpage_section = 'right',
})
