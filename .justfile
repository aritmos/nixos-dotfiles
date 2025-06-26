# TODO: make this system dependent once necessary 
system := 'wsl'


[private]
default:
    @just --list

alias r := rebuild
rebuild:
    git add .
    sudo nixos-rebuild switch --impure --flake ~/.dotfiles/#{{system}}
    exec zsh

alias u := update
update:
    # fetch latest inputs
    sudo nix flake update
    # rebuild
    just rebuild

alias ui := update-input
update-input input:
    sudo nix flake lock --update-input {{input}}
    just rebuild

alias c := clean
[doc('input is of the form `30d`')]
clean input:
    nix-collect-garbage --delete-older-than {{input}}

alias cpn := copy-nvim
copy-nvim:
    rm -r ~/.config/nvim/lua
    cp -r hm/programs/neovim/lua ~/.config/nvim/lua

