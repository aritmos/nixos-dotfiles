-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end


-- -------------------
-- | GLOBAL KEYBINDS |
-- -------------------

local keymap = vim.keymap -- for conciseness

local keymaps = function(client, bufnr)
    local function extend_opts(opts)
        return {
            desc = (opts.desc_prefix or "LSP: ") .. opts.desc,
            noremap = true,
            silent = true,
            buffer = bufnr,
        }
    end

    local binds = require("user.config.keymaps");

    -- generic binds
    for _, bind in ipairs(binds.lsp) do
        keymap.set(bind.mode or "n", bind[1], bind[2], extend_opts(bind.opts))
    end

    -- language-specific binds
    local filetype = vim.bo.filetype;
    if binds.langs[filetype] then
        for _, bind in ipairs(binds.langs[filetype]) do
            keymap.set(bind.mode or "n", bind[1], bind[2], extend_opts(bind.opts))
        end
    end
end


-- ---------------
-- | DIAGNOSTICS |
-- ---------------

-- use default vim diagnostic windows
require("user.core.diagnostics")

-- ------------------
-- | FORMAT ON SAVE |
-- ------------------

local code_file_exts = require("user.config.code-files").file_exts
local exts = ""
for _, ext in ipairs(code_file_exts) do
    exts = exts .. "*." .. ext .. ","
end
exts = exts:sub(1, -2) -- remove the trailing comma
vim.api.nvim_command("autocmd BufWritePre " .. exts .. " lua vim.lsp.buf.format()")


-- ------------------
-- | AUTOCOMPLETION |
-- ------------------

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()


-- ---------------
-- | INLAY HINTS |
-- ---------------

vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })

vim.api.nvim_create_user_command(
    'InlayHintsToggle',
    function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end,
    {}
)

-- -------------
-- | ON ATTACH |
-- -------------

local on_attach = function(client, bufnr)
    -- register keymaps
    keymaps(client, bufnr)
    -- enable inlay hints
    vim.lsp.inlay_hint.enable(true)
end

-- ------------------------
-- | SERVER CONFIGURATION |
-- ------------------------

-- configure lua server (with special settings)
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})


-- Python
lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Rust (rustaceanvim)
-- https://github.com/mrcjkb/rustaceanvim/blob/master/doc/rustaceanvim.txt

vim.g.rustaceanvim = {
    tools = {
        inlay_hints = {
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "~ ",
            highlight = "Comment",
        },
    },
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                check = {
                    command = "clippy",
                    features = "all",
                },
            },
        },
    },
    ---@type rustaceanvim.dap.Opts
    -- dap = {
    --     configuration = {
    -- codelldb dropped rust formatting support in 1.10,
    -- this script, taken from https://github.com/cmrschwarz/rust-prettifier-for-lldb
    -- temporarily fixes the formatting
    -- type = "codelldb",
    -- initCommands = {
    --     "command script import ~/.local/share/nvim/lazy/rust-prettifier-for-lldb/rust_prettifier_for_lldb.py"
    -- },
    --     }
    -- }
}

-- Zig

-- local zig_on_attach = function(client, bufnr)
--     on_attach(client, bufnr)
--
--     -- Ziglings
--     local fn = "require('user.extensions.ziglings').zellij_build_current()"
--     vim.cmd("command! Ziglings lua " .. fn)
--     -- for now we automatically register the keybind to run `:Ziglings`
--     -- later when I finish Ziglings we can remove it.
--     -- TODO: see if there's some way to only load this if we are in the ziglings folder (?)
--     vim.api.nvim_set_keymap("n", "<leader><S-z>", "<CMD>Ziglings<CR>",
--         { noremap = true, silent = true, desc = "Ziglings Build Current" })
-- end

lspconfig.zls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Go

-- local util = require "lspconfig/util"
-- lspconfig.gopls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
--     root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             completeUnimported = true,
--             usePlaceholders = true,
--             analyses = {
--                 unusedparams = true,
--             }
--         }
--     }
-- })

-- C/C++

-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.signatureHelpProvider = false -- ?
--         on_attach(client, bufnr)
--     end,
--     capabilities = capabilities,
--     filetypes = { "c", "cpp", "h", "hpp" },
--     -- NOTE:
--     -- designator hints are removed in the direct clangd config,
--     -- situated in `~/.config/clangd/config.yaml`
--     -- (couldn't find a way to do it within lspconfig)
-- })

-- Java

-- lspconfig.jdtls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- TS

-- lspconfig.ts_ls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- Typst

lspconfig.tinymist.setup({})
