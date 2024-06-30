require("lazy").setup({
	require("nohns.plugins.treesitter"),
	require("nohns.plugins.cmp"),
	require("nohns.plugins.lspconfig"),
	require("nohns.plugins.telescope"),
	require("nohns.plugins.neotest"),
	require("nohns.plugins.conform"),
	require("nohns.plugins.coverage"),
	require("nohns.plugins.floatterm"),
	require("nohns.plugins.trouble"),

	{
		-- Color scheme One Dark as I love it
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000, -- Ensure it loads first

		config = function()
			vim.cmd("colorscheme onedark")
		end,
	},
	{
		-- Custom vim line status line in bottom of the editor
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})

			--Disable default show mode, when in use
			vim.opt.showmode = false
		end,
	},
	{
		-- File explorer
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		-- Navigating seamlessly between tmux panes and neovim windows
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		-- Copilot disabled by default, but easily enabled by cmd
		"github/copilot.vim",
		config = function()
			vim.cmd("Copilot disable")
		end,
	},
	{
		-- Dashboard when booting up neovim. Might change this to something actually useful
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		-- Makes code actions, refactor text field and more appear in floating window center on screen or closer to cursor
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	},
	{
		-- Shows changes of buffers on the side
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>b", "<CMD>Gitsigns blame_line<CR>", { desc = "(G)it (B)lame" })
		end,
	},
	{
		-- Closes html tags more conviently
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		-- Make commenting easier
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		lazy = false,
	},
})
