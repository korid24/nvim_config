local function config()
    require("which-key").add({
      { "<leader>f", group = "Telescope" },
      { "<leader>e", group = "File Manager" },
      { "<leader>h", group = "Git actions" },
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
