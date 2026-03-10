local starter = require('mini.starter')

local function animate_header_colors()
    local colors = {
        '#FF99AA', '#FFB399', '#FFCC99', '#FFE699',
        '#FFFF99', '#E6FF99', '#CCFF99', '#B3FF99',
        '#99FF99', '#99FFB3', '#99FFCC', '#99FFE6',
        '#99FFFF', '#99E6FF', '#99CCFF', '#99B3FF',
        '#9999FF', '#B399FF', '#CC99FF', '#E699FF',
        '#FF99FF', '#FF99E6', '#FF99CC', '#FF99B3'
    }
    local timer = vim.uv.new_timer()
    local idx = 1

    timer:start(0, 400, vim.schedule_wrap(function()
        vim.api.nvim_set_hl(0, 'MiniStarterHeader', { fg = colors[idx] })
        idx = (idx % #colors) + 1
    end))

    vim.api.nvim_create_autocmd('BufLeave', {
        pattern = '*',
        callback = function()
            if timer then
                timer:stop()
                timer:close()
            end
        end,
        once = true,
    })
end

starter.setup({
    header = [[
███  ██ ▄▄▄▄▄  ▄▄▄  ██  ██ ▄▄ ▄▄   ▄▄
██ ▀▄██ ██▄▄  ██▀██ ██▄▄██ ██ ██▀▄▀██
██   ██ ██▄▄▄ ▀███▀  ▀██▀  ██ ██   ██
      ]],


    footer = '(✜︵✜)',
})

vim.defer_fn(animate_header_colors, 75)
