M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    's1n7ax/nvim-window-picker',
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {},
}

function M.config()
    require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        source_selector = {
            winbar = true,
            statusline = false,
            truncation_character = "...",
        },
        default_component_configs = {
            indent = { padding = 1 },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    deleted = "✖",
                    renamed = "󰁕",
                    untracked = "★",
                    ignored = '',
                    unstaged = '󰄱',
                    staged = '',
                    conflict = '',
                },
            },
        },
        window = {
            position = "right",
            width = 35,
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    ".DS_Store",
                    ".idea",
                    ".venv",
                    "thumbs.db",
                },
                hide_by_pattern = {
                  "*/__pycache__",
                },
            },
        },
    })
end


return M
