return {
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree: Toggle" },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("user.config.nvim-tree")
        end,
    },
    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>pz", "<cmd>ZenMode<CR>", desc = "Zen mode" },
        },
        opts = {
            window = {
                backdrop = 0.8,
                width = 0.7,
            },
            plugins = {
                options = {
                    wrap = false -- disable line wrap
                }
            }
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = require("user.config.keymaps").telescope,
        config = function()
            require("user.config.telescope")
        end,
    },
    {
        "ggandor/leap.nvim",
         event = "VeryLazy",
         config = true,
         keys = {
             { "s", "<Plug>(leap-forward-to)", "Leap: Forward" },
             { "S", "<Plug>(leap-backward-to)", "Leap: Backward" },
	 },
    },
    {
        "ggandor/flit.nvim",
        event = "VeryLazy",
        config = true,
    },
}
