DapCommon = {}

function DapCommon.define_signs()
    vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
    })
end

function DapCommon.setup_keymaps()
    local dap = require("dap")

    local function with_description(desc) return { silent = true, noremap = true, desc = desc } end
    local prefix = "<leader><leader>d"

    vim.keymap.set("n", prefix .. "t", dap.toggle_breakpoint, with_description("Toggle debug breakpoint"))
    vim.keymap.set("n", prefix .. "c", dap.continue, with_description("Debug continue"))
    vim.keymap.set("n", prefix .. "o", dap.step_over, with_description("Debug step over"))
    vim.keymap.set("n", prefix .. "i", dap.step_into, with_description("Debug step into"))
    vim.keymap.set("n", prefix .. "O", dap.step_out, with_description("Debug step out"))
    vim.keymap.set("n", prefix .. "q", dap.terminate, with_description("Terminate debug"))
end

return DapCommon
