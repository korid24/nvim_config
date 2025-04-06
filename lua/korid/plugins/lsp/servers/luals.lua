M = {}


--- @return fun(server_name: string)
function M.setup_lua_ls(capabilities)
    local lspconfig = require("lspconfig")

    return function (server_name)
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    completion = { callSnippet = "Replace" },
                },
            },
        })
    end
    
end

return M

