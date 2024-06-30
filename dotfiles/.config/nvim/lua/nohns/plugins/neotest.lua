return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	config = function()
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go")({
					args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
				}),
			},
		})

		-- keybinds for neotest
		vim.keymap.set("n", "<leader>tr", ":lua require('neotest').run.run()<CR>", { silent = true })
		vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { silent = true })
		vim.keymap.set("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { silent = true })
	end,
}
