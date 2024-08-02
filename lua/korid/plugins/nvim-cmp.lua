return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), -- show completion suggestions
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), {"i", "c"}),

        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), -- previous suggestion
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), -- next suggestion
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}), -- close completion window
        -- ["<Enter>"] = function(fallback)
        -- -- Don't block <CR> if signature help is active
        -- -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
        --     if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
        --         fallback()
        --     else
        --         cmp.confirm({
        --             -- Replace word if completing in the middle of a word
        --             -- https://github.com/hrsh7th/nvim-cmp/issues/664
        --             behavior = cmp.ConfirmBehavior.Replace,
        --             -- Don't select first item on CR if nothing was selected
        --             select = false,
        --         })
        --     end
        -- end,
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        --     if cmp.visible() then
        --         local entry = cmp.get_selected_entry()
        --         if not entry then
        --             cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --         else
        --             cmp.confirm()
        --         end
        --     else
        --         fallback()
        --     end
        -- end, {"i", "c"}),
      },
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
