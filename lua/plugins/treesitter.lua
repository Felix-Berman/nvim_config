return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		opts = function(_, opts)
			opts.ensure_installed = { 'lua', 'c' }
			opts.auto_install = true
			opts.highlight = {
				enable = true
			}

			opts.textobjects = opts.textobjects or {}

			opts.textobjects.move = {
				enable = true,
				set_jumps = true,

				goto_next_start = {
					["]m"] = "@function.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
				}
			}

			opts.textobjects.select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				}
			}

			return opts
		end
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
}
