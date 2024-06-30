-- local autocmd = vim.api.nvim_create_autocmd

--------------------------------
----- PERSONAL VIM OPTIONS -----
--------------------------------
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

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

vim.cmd.source "~/.config/nvim/lua/custom/.vimrc"
---------------------------------
-- END OF PERSONAL VIM OPTIONS --
---------------------------------

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
