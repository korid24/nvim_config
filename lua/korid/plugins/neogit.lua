local function config()
    vim.keymap.set("n", "<leader>hw", "<cmd>Neogit kind=floating<CR>", { desc = "Open neogit floating window" })
    require("neogit").setup{
        integrations = {
            -- telescope = true,
            diffview = true,
        },
    }
end

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = config,
}
