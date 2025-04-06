local M = {}

---@param ev vim.api.keyset.create_autocmd.callback_args
---@return fun(mode: string|string[], lhs: string, rhs: string|function, desc?: string)
local function keymap_setter_factory(ev)
    return function (mode, lhs, rhs, desc)
        ---@type vim.keymap.set.Opts
        local opts = { buffer = ev.buf, silent = true, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end


---@param ev vim.api.keyset.create_autocmd.callback_args
function M.setup_keys(ev)
    local keymap_set = keymap_setter_factory(ev)

    keymap_set("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
    keymap_set("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    keymap_set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
    keymap_set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
    keymap_set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",  "Show LSP type definitions")
    keymap_set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,  "See available code actions")
    keymap_set("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
    keymap_set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
    keymap_set("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
    keymap_set("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
    keymap_set("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
end

return M

