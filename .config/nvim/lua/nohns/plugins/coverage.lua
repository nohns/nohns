return {
	-- Graphical test coverage, taking in generated coverage files in the root dir of editor
	-- e.g go needs a go coverage.out file. This is generated by neotest
	"andythigpen/nvim-coverage",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("coverage").setup({
			commands = true, -- create commands
			highlights = {
				-- customize highlight groups created by the plugin
				covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
				uncovered = { fg = "#F07178" },
			},
			signs = {
				-- use your own highlight groups or text markers
				covered = { hl = "CoverageCovered", text = "▎" },
				uncovered = { hl = "CoverageUncovered", text = "▎" },
			},
			summary = {
				-- customize the summary pop-up
				min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
			},
			lang = {
				-- customize language specific settings
			},
		})
	end,
}
