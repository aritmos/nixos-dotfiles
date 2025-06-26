-- language specific plugins
return {
    -- go
    -- {
    --     "ray-x/go.nvim",
    --     dependencies = {
    --         "ray-x/guihua.lua",
    --         "neovim/nvim-lspconfig",
    --         "nvim-treesitter/nvim-treesitter"
    --     },
    --     config = function()
    --         require("go").setup()
    --     end,
    --     ft = { "go", "gomod" },
    -- },
    -- {
    --     "leoluz/nvim-dap-go",
    --     ft = { "go" },
    --     dependencies = {
    --         "rcarriga/nvim-dap-ui", -- loads nvim-dap internally
    --     },
    --     keys = require("user.config.keymaps").dap_go,
    --     config = function()
    --         require("dap-go").setup()
    --     end,
    -- },
    -- rust
    {
        'mrcjkb/rustaceanvim',
        lazy = false, -- This plugin is already lazy
        dependencies = {
            'neovim/nvim-lspconfig'
        },
    },
    {
        "Canop/nvim-bacon",
        ft = "rust",
        keys = {
            { "<leader>bd", ":BaconList<CR>", desc = "Bacon: Display" },
            { "<leader>br", ":BaconLoad<CR>", desc = "Bacon: Load" },
            { "<leader>bn", ":BaconNext<CR>", desc = "Bacon: Next" },
        },
    },
    -- java
    -- {
    --     "nvim-java/nvim-java",
    --     ft = { "java" },
    --     config = function()
    --         require("java").setup()
    --     end,
    -- }
}
