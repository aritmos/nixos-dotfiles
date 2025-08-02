local M = {}

M.lsp = {
    { "<leader>vi", "<cmd>Lspsaga finder<CR>",                   opts = { desc = "[V]iew [I]nfo (Definitions, references)" } },
    { "<leader>vh", "<cmd>Lspsaga hover_doc<CR>",                opts = { desc = "[V]iew [H]over (Diagnostics)" } },
    { "<leader>vH", "<cmd>Lspsaga hover_doc ++keep<CR>",         opts = { desc = "[V]iew [H]over and Pin (Diagnostics)" } },
    { "<leader>vu", "<cmd>Lspsaga finder<CR>",                   opts = { desc = "[V]iew [U]ses" } },

    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",     opts = { desc = "[G]oto [D]efinition" } },
    { "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>", opts = { desc = "[G]oto [I]mplementation" } },

    { "<leader>a",  "<cmd>Lspsaga code_action<CR>",              opts = { desc = "Code [A]ction" } },
    { "<leader>rn", "<cmd>Lspsaga rename autosave=1<CR>",        opts = { desc = "[R]e[n]ame" } },
    { "<leader>E",  "<cmd>Lspsaga outline<CR>",                  opts = { desc = "Outline" } },

    -- use native diagnostics
    { "<leader>d",  "<cmd>lua vim.diagnostic.open_float()<CR>",  opts = { desc = "[D]iagnostic" } },
    -- {"<leader>D", "<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>", opts = { desc = "Workspace Diagnostics" } },
    { "<C-k>",      "<cmd>lua vim.diagnostic.goto_prev()<CR>",   opts = { desc = "Previous Diagnostic" } },
    { "<C-j>",      "<cmd>lua vim.diagnostic.goto_next()<CR>",   opts = { desc = "Next Diagnostic" } },
}

-- function hover_go_to_definition()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     print(line, col)
--     if (line ~= 5) then
--         print("line number must be 5")
--         return
--     end
--     vim.api.nvim_feedkeys("q", "n", false)
--     vim.lsp.buf.definition()
--     local line_def, _ = unpack(vim.api.nvim_win_get_cursor(0))
--     vim.api.nvim_win_set_cursor(0, { line_def, col })
--     vim.lsp.buf.definition()
-- end

M.langs = {
    rust = {
        { "<leader>D",     "<cmd>RustLsp explainError current<CR>", opts = { desc_prefix = "Rust: ", desc = "Explain [D]iagnostic" } },
        { "<leader><S-j>", "<cmd>RustLsp joinLines<CR>",            opts = { desc_prefix = "Rust: ", desc = "[J]oin lines" } },
        { "<leader>a",     "<cmd>RustLsp codeAction<CR>",           opts = { desc_prefix = "Rust: ", desc = "Code [A]ction" } },
        -- { "<leader>x",     hover_go_to_definition,                  opts = { desc_prefix = "Rust: ", desc = "Hover go to definition" } },
    }
}

M.telescope = {
    {
        "<leader>ff",
        ':lua require("telescope.builtin").find_files(require("user.extensions.telescope").minimal_theme())<CR>',
        desc = "Telescope: Find Files",
    },
    { "<leader>fe", "<cmd>Telescope file_browser<CR>",                            desc = "Telescope: Explorer" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",                                 desc = "Telescope: Keymaps" },
    { "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>",                  desc = "Telescope: Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",                               desc = "Telescope: Help Tags" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>",                             desc = "Telescope: Diagnostics" },
    { "<leader>/",  "<cmd>Telescope live_grep<CR>",                               desc = "Telescope: Grep" },
    { "<leader>?",  "<cmd>Telescope current_buffer_fuzzy_find<CR>",               desc = "Telescope: Buffer Grep" },
    { "<A-q>",      "<cmd>lua require('telescope.actions').smart_send_to_qflist", desc = "Telescope: Send to QF list", mode = "i" },

    -- Treesitter menus: (for use in Rust)
    {
        "<leader>tt",
        "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>",
        desc = "[T]elescope: [T]reesitter",
    },
    {
        "<leader>tf",
        "<CMD>lua require('telescope.builtin').lsp_document_symbols({symbols = {'function'}})<CR>",
        desc = "(Telescope) [T]reesitter (file) [F]unctions",
        ft = "rust"
    },
    {
        "<leader>ti",
        "<CMD>lua require('telescope.builtin').lsp_workspace_symbols({symbols = {'interface'}})<CR>",
        desc = "(Telescope) [T]reesitter [I]nterfaces",
        ft = "rust"
    },
    {
        "<leader>ts",
        "<CMD>lua require('telescope.builtin').lsp_workspace_symbols({symbols = {'struct', 'enum'}})<CR>",
        desc = "(Telescope) [T]reesitter [S]tructs/Enums",
        ft = "rust"
    },
    {
        "<leader>ta",
        "<CMD>lua require('user.extensions.telescope').asm()<CR>",
        desc = "[T]elescope: [A]ssembly",
        ft = "rust"
    },

}

M.dap = {
    { "<leader>Db", "<cmd>DapToggleBreakpoint<CR>",               desc = "Toggle [D]ebug [b]reakpoint", silent = true },
    { "<leader>Dh", ":lua require('dap.ui.widgets').hover()<CR>", desc = "[D]ebug [h]over",             silent = true },
    { "<leader>Dr", ":lua require('dap').restart()<CR>",          desc = "[D]ebug [r]estart",           silent = true },
    { "<leader>Dt", ":lua require('dap').restart()<CR>",          desc = "[D]ebug [t]est",              silent = true },
    { "<S-down>",   ":lua require('dap').continue()<CR>",         desc = "Debug Continue",              silent = true },
    { "<down>",     ":lua require('dap').step_over()<CR>",        desc = "Debug Step Over",             silent = true },
    { "<right>",    ":lua require('dap').step_into()<CR>",        desc = "Debug Step Into",             silent = true },
    { "<left>",     ":lua require('dap').step_out()<CR>",         desc = "Debug Step Out",              silent = true },
    -- rust
    {
        "<leader>Dd", "<cmd>RustLsp debuggables<CR>", desc = "(Rust) [D]ebug [d]ebuggables", ft = "rust"
    }

}

M.dap_go = {
    {
        "<leader>Dgt",
        function()
            require("dap-go").debug_test()
        end,
        desc = "[D]ebug [G]o [t]est",
        ft = "go"
    },
    {
        "<leader>Dgl",
        function()
            require("dap-go").debug_last()
        end,
        desc = "[D]ebug [G]o: [l]ast test",
        ft = "go"
    },
}

M.dap_ui = {
    -- reset ensures windows are the correct size when reopening
    { "<leader>Du", ":lua require('dapui').toggle({reset = true})<CR>", desc = "Toggle [D]ebugger [U]I" }
}

return M
