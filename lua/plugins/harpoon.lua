return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup()

		map('n', '<leader>a', function() harpoon:list():add() end)
		map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		map('n', '<C-j>', function() harpoon:list():select(1) end)
		map('n', '<C-k>', function() harpoon:list():select(2) end)
		map('n', '<C-l>', function() harpoon:list():select(3) end)
		map('n', '<C-;>', function() harpoon:list():select(4) end)
		map('n', '<C-S-P>', function() harpoon:list():prev() end)
		map('n', '<C-S-N>', function() harpoon:list():next() end)
	end
}
