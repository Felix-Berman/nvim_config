local term_buf = nil
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
	callback = function()
		vim.cmd('bdelete!')
		term_buf = nil
	end
})

function ToggleTerm()
	local current = vim.api.nvim_get_current_buf()

	if term_buf and current == term_buf then
		vim.cmd('b#')
		return
	end

	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		vim.cmd('buffer ' .. term_buf)
		return
	end

	vim.cmd('terminal')
	term_buf = vim.api.nvim_get_current_buf()
end
