-- files for which lsp and cmp should load

local code_files = {
    -- file type, file extension
    { "lua",        "lua" },
    { "rust",       "rs" },
    { "python",     "py" },
    { "java",       "java" },
    { "kotlin",     "kt" },
    { "typescript", "ts" },
    { "zig",        "zig" },
    { "nix",        "nix" },
}

local file_types = {}
local file_exts = {}

for _, pair in ipairs(code_files) do
    table.insert(file_types, pair[1])
    table.insert(file_exts, pair[2])
end

return {
    file_types = file_types,
    file_exts = file_exts,
}
