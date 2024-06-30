---@type MappingsTable
local M = {}

M.general = {
  n = {
    --    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<C-f>"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    -- Delete rest of arguments
    --   ["da"] = {
    --     "di)",
    --     "da to delete arguments",
    --   },
    --   -- Go to first argument
    --   ["ga"] = {
    --     "f(",
    --   },

    ["<leader>rf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<C-w>"] = { "~", "remap: invert case" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-w>"] = { "~", "remap: invert case" },
  },
  x = {
    ["<leader>p"] = { [["_dP]] },
  },
  i = { ["<C-x>"] = { "<esc>", "ee to enter normal mode" } },
}

-- more keybinds!

return M
