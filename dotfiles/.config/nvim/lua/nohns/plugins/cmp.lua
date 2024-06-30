return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		--Snippet support
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",

		-- autopairing of (){}[] etc
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
		},
	},

	config = function(_, opts)
		local cmp = require("cmp")

		local item_kind_icons = {
			Variable = "",
			Field = "",
			Property = "",
			Constant = "",
			Function = "󰡱",
			Method = "󰡱",
			Module = "󰏗",
			Struct = "",
			Class = "",
			Constructor = "󰡢",
			Snippet = "󰘖",
			Text = "󰚞",
			Keyword = "",
			Interface = "",
			File = "",
			Folder = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
			Enum = "",
			Color = "󰏘",
			Reference = "",
			Value = "󰎠",
			Unit = "",
		}

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" }, -- For showing function signature help when entering params
				{ name = "vsnip" }, -- For vsnip users.
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(_, vim_item)
					local kind = vim_item.kind
					vim_item.kind = (item_kind_icons[kind] or "") .. " "
					vim_item.menu = " (" .. kind .. ")"

					return vim_item
				end,
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		-- setup cmp for autopairs
		require("nvim-autopairs").setup(opts)
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
