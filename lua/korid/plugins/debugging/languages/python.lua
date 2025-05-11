M = {}

function M.setup_python_dap()
    local dap_p = require("dap-python")

    local python_path = require("korid.internal.python_venv_finder").get_python_path()
    dap_p.setup(python_path)
    local configs = require("dap").configurations.python

    table.insert(configs, {
      type = 'python',
      request = 'launch',
      name = 'common app',
      module = 'app',
      env = {PROJECT_ENV = "local"}
    })

    table.insert(configs, {
      type = 'python',
      request = 'launch',
      name = 'celery',
      module = 'celery',
      args = {"-A", "app.worker", "worker", "--beat", "-s", "local/schedule"},
      env = {PROJECT_ENV = "local"}
    })
end

return M
