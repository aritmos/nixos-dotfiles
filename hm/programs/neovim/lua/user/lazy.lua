vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings

local config = {
    spec = {
        -- Import plugins from lua/plugins
        { import = "plugins" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        }
    },
}

if vim.g.os_id == "nixos" then
    print("[loading: NixOS config]")
    local nixos_config = {
        performance = {
            reset_packpath = false,
            rtp = {
                reset = false,
            }
        },
        dev = {
            -- the `myNeovimPackages` directory cannot be renamed,
            -- it is where home-manager installs the plugins we specify.
            path = os.getenv("NEOVIM_PACKPATH_DIR") .. "/pack/myNeovimPackages/start",
            patterns = { "" }, -- Specify that all of our plugins will use the dev dir (empty string is wildcard)
        },
        install = {
            -- Safeguard in case we forget to install a plugin with Nix
            missing = false,
        },
    }

    config = vim.tbl_deep_extend("force", config, nixos_config)
else
    print("[loading: Arch config]")
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

require("lazy").setup(config)
