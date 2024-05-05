return {
    {
        'nvim-telescope/telescope.nvim',

        lazy = false,
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },

        config = function()
            require('telescope').setup({
                file_ignore_patterns = {
                    "node_modules/.*",
                    ".git/.*",
                    "lazy-lock.json"
                }
            })
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader><leader>', function()
                builtin.oldfiles({ cwd_only = true })
            end, {})
            vim.keymap.set('n', '<leader>ff', function()
                builtin.find_files({ no_ignore_parent = true })
            end, {})
            vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("grep > ") });
            end)
        end
    },
    -- {
    --     "nvim-telescope/telescope-frecency.nvim",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     config = function()
    --         require("telescope").load_extension("frecency")
    --         vim.keymap.set('n', '<leader><leader>', function()
    --             require("telescope").extensions.frecency.frecency({
    --                 workspace = "CWD",
    --                 hide_current_buffer = true,
    --             })
    --         end, {})
    --     end,
    -- }
}
