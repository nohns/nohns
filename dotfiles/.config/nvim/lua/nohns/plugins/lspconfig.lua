-- Configure lspconfig for neovim
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"lukas-reineke/lsp-format.nvim",
		"mattn/vim-goimports", -- not really an LSP dependency, but formatting stuff is all configured here anyway
	},

	config = function()
		local lsps = {
			{
				"html",
				filetypes = { "html", "templ" },
			},
			"cssls",
			{
				"tailwindcss",
				filetypes = { "templ", "javascript", "typescript", "react" },
				init_options = { userLanguages = { templ = "html" } },
			},
			"jsonls",
			"yamlls",
			"dockerls",
			"bashls",
			{
				"gopls",
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			},
			"templ",
			{
				"lua_ls",
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
					},
				},
			},
			"csharp_ls",
			"tsserver",
			"eslint",
		}
		local lsp_list = {}
		for _, lsp in ipairs(lsps) do
			if type(lsp) == "string" then
				table.insert(lsp_list, lsp)
			else
				table.insert(lsp_list, lsp[1])
			end
		end

		-- Setup Mason and LSP dependencies
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = lsp_list,
			automatic_installation = true,
		})
		require("lsp-format").setup()

		local clientCapabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(clientCapabilities)

		local on_attach = function(client, bufnr)
			-- Disable format on save for now, as it interferes with undo history
			--require("lsp-format").on_attach(client, bufnr)
		end
		local lsp_setup = function(name, settings)
			require("lspconfig")[name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = settings or {},
			})
		end

		-- Setup LSP servers
		for _, lsp in ipairs(lsps) do
			if type(lsp) == "string" then
				lsp_setup(lsp)
			else
				lsp_setup(lsp[1], lsp.settings)
			end
		end

		-- Specific Templ setup
		vim.filetype.add({ extension = { templ = "templ" } })

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- DISABLED lsp formatting as it is assigned inside together with conform
				-- vim.keymap.set('n', '<leader>f', function()
				--     vim.lsp.buf.format { async = true }
				-- end, opts)
			end,
		})
	end,
}
