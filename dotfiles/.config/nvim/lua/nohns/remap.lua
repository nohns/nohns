vim.g.mapleader = " "

vim.keymap.set("n", "x", [["_x]])
vim.keymap.set("n", "cc", [["_cc]])

-- Move lines up or down when in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Navigate up or down in pages, while staying centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Stay centered when navigating around search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Vsplit
vim.keymap.set("n", "<leader>vs", "<CMD>vsplit<CR>")

-- Global bindings for good LSP support
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-q>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-e>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

--Some great remaps, stolen from primeagen
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Script shortcuts
vim.keymap.set(
	"n",
	"<leader>s",
	"<cmd>FloatermNew --height=0.8 --width=0.8 --wintype=float --name=tmux-active-sessionizer ~/.scripts/tmux-active-sessionizer<CR>"
)

-- Language snippets
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>gg", "<cmd>GoImportRun<CR>")
