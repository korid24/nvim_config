return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        lualine.setup({
            options = {
                theme = "vague",
            },
            section_separators = { left = "", right = "" },
            sections = {
                lualine_c = { { "filename", path = 3 } },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    {
                        "fileformat",
                        symbols = {
                            unix = '', -- e712
                            dos = '', -- e70f
                            mac = '', -- e711
                        }
                    },
                    { "filetype" },
                },
            },
        })
    end,
}
