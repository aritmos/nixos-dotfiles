vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings

require("lazy").setup({
  performance = {
    reset_packpath = false,
    rtp = {
        reset = false,
      }
    },
  dev = {
    -- the `myNeovimPackages` directory cannot be renamed,
    -- it is where home-manager installs the plugins we specify.
    -- `{{PACKPATH_DIRS}}` is replaced before the file gets written into `init.lua`
    path = "{{PACKPATH_DIRS}}/pack/myNeovimPackages/start",
    patterns = {""}, -- Specify that all of our plugins will use the dev dir (empty string is wildcard)
  },
  install = {
    -- Safeguard in case we forget to install a plugin with Nix
    missing = false,
  },
  spec = {
    -- Import plugins from lua/plugins
    { import = "plugins" },
  },
})

require("user.core.options")
--require("user.core.keymaps")
--require("user.core.specials")
