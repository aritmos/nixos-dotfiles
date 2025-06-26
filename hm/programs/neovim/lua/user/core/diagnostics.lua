vim.diagnostic.config({
    virtual_text = false,
    -- virual_lines = { only_current_line = true },
    signs = {
        [vim.diagnostic.severity.ERROR] = { text = "E", texthl = "DiagonsticSignError" },
        [vim.diagnostic.severity.WARN] = { text = "W", texthl = "DiagonsticSignWarn" },
        [vim.diagnostic.severity.HINT] = { text = "H", texthl = "DiagonsticSignHint" },
        [vim.diagnostic.severity.INFO] = { text = "I", texthl = "DiagonsticSignInfo" },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = "solid",
        source = true,
        header = "",
        prefix = "",
    },
})
