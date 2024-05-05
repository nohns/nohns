return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local format_opts = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
			quiet = true,
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },

				go = { "goimports", "gofumpt" },

				lua = { "stylua" },
			},
			format_on_save = format_opts,
		})

		-- Format keybind
		vim.keymap.set("n", "<leader>f", function()
			conform.format()
		end, { desc = "Format file" })
	end,
}
