# [home-manager]
{ config, pkgs, ...}:

let 
  packpathDirs = pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs;

  inlay-hint-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "inlay-hint-nvim";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "felpafel";
      repo = "inlay-hint.nvim";
      # latest commit as of 2025-05-11
      rev = "9dce1b25bc60fd9cf06e548c2143ab87517c5cd6";
      # run rebuild with empty hash and it will tell you what it got:
      hash = "sha256-B2Y1Qls6R+F9Ws4pKMleGP7ISEybq3VxZZAMkqEdR5E=";
    };
  };
in
{
  home.file."${config.xdg.configHome}/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };

  home.sessionVariables = {
    NEOVIM_PACKPATH_DIR = builtins.toString packpathDirs;
  };

  # TODO: setup vimPluginsUpdater
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      # --- code
      nvim-cmp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      friendly-snippets
      lspkind-nvim

      nvim-surround

      ReplaceWithRegister

      nvim-autopairs

      mini-nvim

      todo-comments-nvim

      hover-nvim

      # nvim-dap
      # nvim-dap-virtual-text
      #
      # nvim-dap-ui
      # nvim-nio

      gitsigns-nvim

      (nvim-treesitter.withPlugins (plugins: with plugins; [
        c
        cpp
        lua
        rust
        python
        toml
        markdown
        markdown_inline
        zig
        nix
        just
      ]))
      nvim-treesitter-textobjects
      nvim-treesitter-context

      # --- editor
      nvim-tree-lua 
      nvim-web-devicons

      zen-mode-nvim

      telescope-nvim
      telescope-fzy-native-nvim
      telescope-file-browser-nvim
      plenary-nvim

      leap-nvim

      flit-nvim

      harpoon

      snacks-nvim

      # --- langs
      rustaceanvim

      nvim-bacon

      # --- lsp 
      # (lsp server installs are in home.nix alongside the langs)

      nvim-lspconfig
      cmp-nvim-lsp

      lspsaga-nvim

      fidget-nvim

      inlay-hint-nvim

      # --- ui
      onedark-nvim

      lualine-nvim
    ];

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
