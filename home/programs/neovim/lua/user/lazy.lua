
vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings

require("lazy").setup({
  performance = {
    reset_packpath = false,
    rtp = {
        reset = false,
      }
    },
  dev = {
    path = "${pkgs.vimUtils.packDir config.home-manager.users."nixos".programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
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
