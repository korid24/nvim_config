return {
     "williamboman/mason.nvim",
    dependencies = {
         "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "basedpyright", -- python lsp
                "ruff", -- python lint & format
                "gopls", -- go lsp
            },
            automatic_installation = false,
            automatic_enable = false,
        })
    end,
}
