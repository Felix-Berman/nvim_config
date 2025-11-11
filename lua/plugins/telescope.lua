return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		}
	},

	config = function()
		require('telescope').setup {
		}

		pcall(require('telescope').load_extension, 'fzf')

		local builtin = require 'telescope.builtin'
		map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind with [G]rep' })
		map('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
		map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		map('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers' })
		map('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer' })
		map('n', '<leader>fn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[F]ind files in [N]eovim config' })
	end
}
