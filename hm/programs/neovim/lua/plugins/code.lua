-- code related plugins

local codefiles = require("user.config.code-files").file_types

return {
    -- autocompletion
    {
        "hrsh7th/nvim-cmp",
        ft = codefiles,
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            -- snippets
            { "L3MON4D3/LuaSnip", name= "luasnip" },
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",

            -- lsp pictograms
            "onsails/lspkind.nvim",
        },
        config = function()
            require("user.config.nvim-cmp") -- cmp + luasnip
        end,
    },
    -- quality of life
    {
        "kylechui/nvim-surround",
        event = "BufReadPre",
        config = true,
    },
    {
        "vim-scripts/ReplaceWithRegister",
        keys = { { "gr" } },
        event = "VeryLazy",
    },
    {
        "windwp/nvim-autopairs",
        event = "BufReadPre",
        config = function()
            require("user.config.autopairs")
        end,
    },
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        version = false,
        config = function()
            require("mini.comment").setup({})
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
            keywords = {
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "SAFETY" } },
                IMPR = { icon = "", color = "hint", alt = { "IMPROVE", "IMPROVEMENT" } },
                DNP = { icon = "󰂭", color = "error", alt = { "DO NOT PUSH" } }
            },
        },
    },
    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup({
                init = function()
                    require("hover.providers.lsp")
                    require("hover.providers.diagnostic")
                end
            })
        end
    },
    -- debugging
    -- {
    --     "mfussenegger/nvim-dap",
    --     dependencies = {
    --         "theHamsta/nvim-dap-virtual-text"
    --     },
    --     ft = codefiles,
    --     keys = require("user.config.keymaps").dap,
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     ft = codefiles,
    --     dependencies = {
    --         "mfussenegger/nvim-dap",
    --         "nvim-neotest/nvim-nio",
    --     },
    --     config = function()
    --         require("user.config.dap")
    --     end,
    --     keys = require("user.config.keymaps").dap_ui,
    -- },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "mfussenegger/nvim-dap"
    --     },
    --     opts = {
    --         handlers = {}
    --     }
    -- },
    -- git
    {
        "lewis6991/gitsigns.nvim",
        ft = codefiles,
        opts = {
            attach_to_untracked = true,
        }
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        -- build = ":TSUpdate",
        config = function()
            -- includes config for `nvim-treesitter-textobjects`
            require("user.config.treesitter")
        end,
        dependencies = {
            -- configs managed by `nvim-treesitter`
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context"
        },
    },
}

