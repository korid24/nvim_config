local function config()
    wk = require("which-key")
    wk.add({
      { "<leader>f", group = "Telescope" },
      { "<leader>e", group = "File Manager" },
      { "<leader>b", group = "buffers", expand = function() return require("which-key.extras").expand.buf() end},
    })
    
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
  config = config,
}
