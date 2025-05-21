# TODO: make this system dependent once necessary 
system := 'wsl'

alias r := rebuild

default:
    just --list

rebuild:
    git add .
    sudo nixos-rebuild switch --impure --flake ~/.dotfiles/#{{system}}
    exec zsh

update:
    # fetch latest inputs
    sudo nix flake update
    # rebuild
    just rebuild

update-input input:
    sudo nix flake lock --update-input {{input}}
    just rebuild

cp-nvim:
    cp -r hm/programs/neovim/lua ~/.config/nvim/lua
