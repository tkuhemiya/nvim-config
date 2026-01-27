require "mini.pick".setup()

require "mason".setup({
  registries = {
    "github:mason-org/mason-registry",
  },
})

local telescope = require "telescope"
telescope.setup({
  defaults = {
    preview = { treesitter = false },
    color_devicons = true,
    sorting_strategy = "ascending",
    borderchars = {
      "─", -- top
      "│", -- right
      "─", -- bottom
      "│", -- left
      "┌", -- top-left
      "┐", -- top-right
      "┘", -- bottom-right
      "└", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    }
  }
})
telescope.load_extension("ui-select")

require("blink.cmp").setup({
  keymap = {
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },
  completion = {
    documentation = {
      auto_show = false,
    },
    menu = {
      border = "rounded",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
