return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            pickers = {
                oldfiles = {
                    cwd_only = true,
                }
            },
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<C-x>'] = actions.delete_buffer, -- Telescope buffers only
                        ['<C-s>'] = actions.file_vsplit, -- Telescope buffers only
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find not ignored files in cwd" })
        vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files no_ignore=true<cr>", { desc = "Find all files in cwd" })
        vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_branches<cr>", { desc = "Find git branches" })
        vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
    end,
}
