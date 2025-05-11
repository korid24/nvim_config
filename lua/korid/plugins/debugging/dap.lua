Dap = {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",  -- for dap-ui
    },
}

function Dap.config()
    local dap_common = require("korid.plugins.debugging.utils.common")
    dap_common.define_signs()
    dap_common.setup_keymaps()

    require("korid.plugins.debugging.utils.dap-ui").setup_dap_ui()

    -- setup for language
    require("korid.plugins.debugging.languages.python").setup_python_dap()
end

return Dap
