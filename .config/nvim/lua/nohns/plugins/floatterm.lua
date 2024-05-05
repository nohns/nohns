return {
	-- Make it easy to open terminals when in neovim
	"voldikss/vim-floaterm",

	config = function()
		vim.g.floaterm_autoclose = 2 -- Auto close terminal on exit, no matter exit code

		-- Keymaps for spawning terminals
		vim.keymap.set("n", "<leader>th", function()
			vim.cmd(
				"FloatermNew --cwd="
					.. vim.fn.expand("%:p:h")
					.. " --wintype=float --height=0.9 --width=0.9 --position=right --wintitle=terminal"
			)
		end, { desc = "[T]erminal [H]ere", silent = true })
		vim.keymap.set("n", "<leader>tt", function()
			vim.cmd(
				"FloatermNew --cwd="
					.. vim.fn.getcwd()
					.. " --wintype=float --height=0.9 --width=0.9 --position=right --wintitle=terminal"
			)
		end, { desc = "[T]erminal [T]op directory", silent = true })
	end,
}
