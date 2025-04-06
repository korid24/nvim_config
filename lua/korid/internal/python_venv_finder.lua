local M = {}

local buf_cache = setmetatable({}, { __mode = "k" })

local python_bin = "bin/python"

---@param bufnr integer?
local function find_project_root(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local current_file = vim.api.nvim_buf_get_name(bufnr)

    local current_dir = current_file ~= '' and vim.fn.fnamemodify(current_file, ':h') or vim.fn.getcwd()

    local markers = {
        '.git',
        'pyproject.toml',
        'requirements.txt',
        'setup.py',
        'Pipfile',
        'poetry.lock'
    }

    local root = current_dir
    while true do
        for _, marker in ipairs(markers) do
            local path = vim.fn.glob(root .. '/' .. marker)
            if path ~= '' then
                return root
            end
        end

        local parent = vim.fn.fnamemodify(root, ':h')
        if parent == root then
            break
        end
        root = parent
    end

    return current_dir
end

local function get_poetry_venv(project_root)
    if vim.fn.executable('poetry') == 0 then return nil end
    if vim.fn.filereadable(project_root .. '/pyproject.toml') == 0 then return nil end

    local handle = io.popen('poetry env info --path 2>/dev/null')
    if handle == nil then return nil end

    local path = handle:read('*a')
    handle:close()

    path = vim.trim(path)
    if path == '' then return nil end

    local python_path = path .. '/' .. python_bin
    return vim.fn.filereadable(python_path) == 1 and python_path or nil
end

local function get_venv_path(project_root)
    local candidates = {'.venv', 'venv'}
    for _, name in ipairs(candidates) do
        local venv_path = project_root .. '/' .. name
        if vim.fn.isdirectory(venv_path) == 1 then
            local python_path = venv_path .. '/' .. python_bin
            if vim.fn.filereadable(python_path) == 1 then
                return python_path
            end
        end
    end
    return nil
end

local function get_pyenv_python(project_root)
    if vim.fn.executable('pyenv') == 0 then return nil end

    local version_file = project_root .. '/.python-version'
    if vim.fn.filereadable(version_file) == 0 then return nil end

    local handle = io.popen('pyenv which python 2>/dev/null')
    if handle == nil then return nil end
    local path = handle:read('*l')
    handle:close()

    path = vim.trim(path)
    if path == '' then return nil end

    return vim.fn.filereadable(path) == 1 and path or nil
end

local function get_default_python()
    if vim.g.python3_host_prog and vim.g.python3_host_prog ~= '' then
        return vim.g.python3_host_prog
    end
    return 'python3'
end


--- @param bufnr integer?
--- @return string?
function M.find_project_root(bufnr)
    return find_project_root(bufnr)
end

--- @param bufnr integer?
--- @return string?
function M.get_python_path(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    if buf_cache[bufnr] then return buf_cache[bufnr] end

    local project_root = find_project_root(bufnr)

    local result = get_poetry_venv(project_root)
        or get_venv_path(project_root)
        or get_pyenv_python(project_root)
        or get_default_python()

    buf_cache[bufnr] = result

    return result

end

vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
        buf_cache[args.buf] = nil
    end
})

return M
