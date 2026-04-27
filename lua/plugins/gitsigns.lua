return {
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			on_attach = function(bufnr)
				local map = vim.keymap.set
				local opts = { buffer = bufnr, silent = true }

				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal("]c")
					else
						require('gitsigns').next_hunk()
					end
				end, opts)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal("[c")
					else
						require('gitsigns').prev_hunk()
					end
				end, opts)
			end,
		},
	},
}
