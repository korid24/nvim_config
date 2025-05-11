M = {}

local lspconfig = require("lspconfig")
local venv_finder = require("korid.internal.python_venv_finder")

function M.setup_based_pyright(capabilities)
    return function(server_name)
        lspconfig.basedpyright.setup({
            cmd = { "basedpyright-langserver", "--stdio" },
            capabilits = capabilities,
            root_dir = function(fname)
                return venv_finder.find_project_root(fname and vim.fn.bufnr(fname))
            end,
            settings = {
                basedpyright = {
                    analysis = {
                        allowedUntypedLibraries = { "celery", "Celery" },  -- TODO: not works
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = 'openFilesOnly',
                        strict = true,
                        typeCheckingMode = "strict",
                        diagnosticSeverityOverrides = {
                            reportUnusedVariable = "warning",
                            reportUnknownMemberType = "warning",
                            reportUnknownParameterType = "warning",
                            reportMissingTypeArgument = "warning",
                            reportUnknownVariableType = "warning",
                            reportUnusedFunction = "warning",
                            reportUnknownLambdaType = false,
                            reportMissingTypeStubs = false,
                            reportUnusedImport = false,
                        }
                    },
                },
                python = {},
            },
            on_init = function(client)
                client.config.settings.python.pythonPath = venv_finder.get_python_path()
            end,
            on_new_config = function(new_config)
                new_config.settings.python.pythonPath = venv_finder.get_python_path()
            end
        })
    end
end

return M
