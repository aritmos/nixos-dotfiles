-- lsp related plugins

return {
    -- {
    --     "williamboman/mason.nvim",
    --     cmd = "Mason",
    --     keys = { { "<leader>pm", "<cmd>Mason<cr>", desc = "Plugins: Mason" } },
    --     dependencies = {
    --         "jayp0521/mason-null-ls.nvim",
    --         "williamboman/mason-lspconfig.nvim",
    --     },
    --     config = function()
    --         require("user.config.lsp.mason")
    --     end,
    -- },
    {
        "neovim/nvim-lspconfig",
        ft = require("user.config.code-files").file_types,
        dependencies = {
            "mrcjkb/rustaceanvim",  -- (config dependency)
            "hrsh7th/cmp-nvim-lsp", -- (config dependency)
            -- "williamboman/mason.nvim",
            -- "williamboman/mason-lspconfig.nvim", -- (server dependency)
        },
        -- keybinds defined within config file (below)
        config = function()
            require("user.config.lsp.lspconfig")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        config = function()
            require("user.config.lsp.lspsaga")
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {
            notification = { poll_rate = 50, window = { max_width = 40 } },
        }
    },
    {
        "felpafel/inlay-hint.nvim",
        name = "inlay-hint-nvim",
        event = "LspAttach",
        commands = { enable = true }, -- enable InlayHints commands
        config = function()
            require("user.config.lsp.inlay-hint")
        end,
    }
}
