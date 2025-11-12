return {
	'NMAC427/guess-indent.nvim',
	'lewis6991/gitsigns.nvim',
	'folke/which-key.nvim',
	{ 
		'nvim-mini/mini.surround',
		version = '*',
		config = function()
			require('mini.surround').setup()
		end
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').load()
		end
	},
}
