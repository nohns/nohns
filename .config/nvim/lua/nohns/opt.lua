-- fat cursor
-- vim.opt.guicursor = ""

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = false

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append "unnamedplus"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Backup with undotree
vim.opt.swapfile = false
vim.opt.backup = false
---@diagnostic disable-next-line: assign-type-mismatch
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

-- better searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Set completevim.opt.to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- [[ Basic Keymaps ]]
-- Keymap for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Disable auto-comment on newline
vim.opt.formatoptions:remove { "r", "o" }
