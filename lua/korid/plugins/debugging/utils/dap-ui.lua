M = {}

function M.setup_dap_ui()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    ---@diagnostic disable-next-line: missing-fields
    require("nvim-dap-virtual-text").setup({ commented = true })

    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close
end

return M
