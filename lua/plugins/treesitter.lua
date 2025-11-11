return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',
	opts = {
		ensure_installed = { 'lua', 'c' },
		auto_install = true,
		highlight = {
			enable = true
		}
	}
}
