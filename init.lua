vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [Options]
vim.o.textwidth = 80
vim.o.colorcolumn = '81'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.showmode = true
vim.o.signcolumn = 'yes'
vim.o.list = true
vim.opt.listchars = { tab = '▏ ', trail = '•', nbsp = '␣' }
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
map({ 'n', 't' }, '<F7>', function() ToggleTerm() end, { desc = 'Open [T]erminal' })
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

require('config.lazy')
