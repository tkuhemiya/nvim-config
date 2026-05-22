require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c', 'cpp', 'go', 'gomod', 'gowork', 'gosum',
		'lua', 'javascript', 'typescript', 'rust',
		'python', 'markdown', 'zig',
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
