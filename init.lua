vim.cmd('colorscheme habamax')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [Options]
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.showmode = true
vim.o.signcolumn = 'yes'
vim.o.list = true
vim.opt.listchars = { tab = '▏ ', trail = '.', nbsp = '␣' }
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.timeoutlen = 500
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.shell = 'cmd.exe'

-- [Keymaps]
function map(modes, key, command, opts)
	vim.keymap.set(modes, key, command, opts)
end
map('n', '<leader>e', '<cmd>Ex<CR>')
map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights with esc
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>t', '<cmd>terminal<CR>', { desc = 'Open [T]erminal' })
map('n', '<leader>vt', '<cmd>vsplit | terminal<CR>', { desc = 'Open [T]erminal with [V]ertical split' })
map({ 'n', 'v' }, '<leader>y', '"+y')
map('n', '<leader>Y', '"+yy')
map({ 'n', 'v' }, '<leader>p', '"+p')
map({ 'n', 'v' }, '<leader>P', '"+P')

-- [AutoCommands]
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	callback = function()
		vim.hl.on_yank()
	end,
})

local term_insert_group = vim.api.nvim_create_augroup('term-insert', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
	group = term_insert_group,
	pattern = 'term://*',
	command = 'startinsert',
})

-- enter insert mode after 1ms delay after terminal buffer is modifiable
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' } , {
	group = term_insert_group,
	pattern = 'term://*',
	callback = function()
		vim.defer_fn(function()
			vim.cmd('startinsert')
		end, 1)
	end,
})

vim.api.nvim_create_autocmd('TermClose', {
	group = vim.api.nvim_create_augroup('term-close', { clear = true }),
	pattern = 'term://*',
	command = 'bdelete!',
})

require('config.lazy')
