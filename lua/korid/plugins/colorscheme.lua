return {
    {
        "catppuccin/nvim",
        -- "dhruvinsh/onecat",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("catppuccin").setup({
        flavour = "mocha",
            term_colors = true,
            -- transparent_background = true,
            no_italic = false,
            no_bold = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = { "italic" },
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = { "bold" },
            },
            color_overrides = {
                mocha = {
                    -- background
                    base = "#171717",
                    -- ?
                    -- mantle

                    -- blankline idents
                    surface0 = "#3e4451",
                    -- --
                    -- surface1 = "#545862",
                    -- surface2 = "#565c64",
                    -- text = "#abb2bf",
                    -- rosewater = "#b6bdca",
                    -- lavender = "#c8ccd4",
                    -- red = "#e06c75",
                    -- peach = "#d19a66",
                    -- yellow = "#e5c07b",
                    -- green = "#98c379",
                    -- teal = "#56b6c2",
                    -- blue = "#61afef",
                    -- mauve = "#c678dd",
                    -- flamingo = "#be5046",
                    --
                    -- -- extra colors not decided what to do
                    -- pink = "#F5C2E7",
                    -- maroon = "#EBA0AC",
                    -- sky = "#89DCEB",
                    -- sapphire = "#74C7EC",
                    --
                    -- subtext1 = "#BAC2DE",
                    -- subtext0 = "#A6ADC8",
                    -- overlay2 = "#9399B2",
                    -- overlay1 = "#7F849C",
                    -- overlay0 = "#6C7086",
                    --
                    -- crust = "#11111B",
                },
            },
            highlight_overrides = {
                mocha = function(C)
                    return {
                        NvimTreeNormal = { bg = C.none },
                        CmpBorder = { fg = C.surface2 },
                        TelescopeBorder = { link = "FloatBorder" },
                    }
                end,
            },})
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
