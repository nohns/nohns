-- Auto save
-- vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
--     pattern = '*',
--     callback = function()
--         if
--             vim.bo.readonly
--             or vim.api.nvim_buf_get_name(0) == ''
--             or vim.bo.buftype ~= ''
--             or not (vim.bo.modifiable and vim.bo.modified)
--         then
--             return
--         end
--         vim.cmd('silent w')
--         vim.cmd('doau BufWritePost')
--     end
-- })

-- Auto save when leaving buffer, or unfocusing neovim (e.g going to another tmux window or session)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	pattern = "*",
	callback = function()
		if
			vim.bo.readonly
			or vim.api.nvim_buf_get_name(0) == ""
			or vim.bo.buftype ~= ""
			or not (vim.bo.modifiable and vim.bo.modified)
		then
			return
		end

		vim.cmd("doau BufWritePre")
		vim.cmd("silent w")
	end,
})
