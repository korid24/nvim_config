vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = require("korid.plugins.lsp.utils.keymaps").setup_keys
})

require("korid.plugins.lsp.utils.define_signs")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      require("korid.plugins.lsp.servers.default").setup_default(capabilities),
      ["basedpyright"] = require("korid.plugins.lsp.servers.basedpyright").setup_based_pyright(capabilities),
      ["lua_ls"] = require("korid.plugins.lsp.servers.luals").setup_lua_ls(capabilities)
    })
  end,
}
