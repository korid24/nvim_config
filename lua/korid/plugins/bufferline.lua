local function config()
  local bufferline = require('bufferline')
  bufferline.setup({
    options = {
      always_show_bufferline = true,
      style_preset = {
        bufferline.style_preset.minimal,
        bufferline.style_preset.no_italic,
      },
      buffer_close_icon = 'x',
      diagnostics = false,
      color_icons = true,
    },
  })
end

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = config,
}

