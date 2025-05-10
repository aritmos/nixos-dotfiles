vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- for `silent' use: opts = { silent = true }

-- INSERT MODE --

-- map("i", "jj", "<ESC>")

-- NORMAL MODE --

-- movement
map("n", "J", "<C-d>zz", { desc = "Goto Half Page Down" })
map("n", "K", "<C-u>zz", { desc = "Goto Half Page Up" })
map("n", "H", "^", { desc = "Goto Line Start" })
map("n", "L", "$", { desc = "Goto Line End" })

map("n", "gJ", "gj", { desc = "Goto next visual line" })
map("n", "gK", "gk", { desc = "Goto prev visual line" })

-- add lines
map("n", "<leader>o", "o<ESC>")
map("n", "<leader>O", "O<ESC>")

-- join lines
map("n", "<leader>J", "J")

-- buffers
map("n", "<leader>w", ":up<CR>", { silent = true })
map("n", "<leader>q", ":bd<CR>", { silent = true })
-- map("n", "<leader>x", ":q!<CR>") -- disabled as it's a bad habit

-- yank and paste
map("n", "Y", "y$")
map("n", "<leader>y", "<CMD>%y<CR>", { desc = "Yank File" })
map("n", "<C-p>", '"0p', { desc = "Paste Yanked" })
map("n", "<C-P>", '"0P', { desc = "Paste Yanked (Above)" })

-- redo
map("n", "U", "<C-R>", { desc = "Redo" })

-- visual mode indenting
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Unindent" })

-- windows splits
-- map("n", "<leader>sv", "<C-w>v", { desc = "Split: Vertical" })
-- map("n", "<leader>sh", "<C-w>s", { desc = "Split: Horizontal" })
-- map("n", "<leader>se", "<C-w>=", { desc = "Split: Make Equal" })
-- map("n", "<leader>sx", ":close<CR>", { desc = "Split: Close" })

map("n", "gk", ":wincmd k<CR>", { desc = "Move: Split Up" })
map("n", "gj", ":wincmd j<CR>", { desc = "Move: Split Down" })
map("n", "gh", ":wincmd h<CR>", { desc = "Move: Split Left" })
map("n", "gl", ":wincmd l<CR>", { desc = "Move: Split Right" })

-- tabs (unused due to harpoon)
-- map("n", "<leader>to", ":tabnew<CR>", { desc = "Tab: New" })
-- map("n", "<leader>tx", ":tabclose<CR>", { desc = "Tab: Close" })
-- map("n", "<leader>tk", ":tabn<CR>", { desc = "Tab: Next" })
-- map("n", "<leader>tj", ":tabp<CR>", { desc = "Tab: Prev" })

-- misc
map("n", "<ESC>", ":nohl<CR>", { desc = "Remove Highlight" })
map("n", "x", '"_x') -- dont delete text into register
map("n", "<Enter>", "<C-w>w", { desc = "Enter floating window" })

-- cd into neovim config
config_src_dir = vim.fn.stdpath('config')
if vim.g.os_id == "nixos" then
    config_src_dir = vim.fn.getenv("HOME") .. "/.dotfiles/hm/programs/neovim"
end
map("n", "<leader>,", ":lua vim.cmd('cd' .. config_src_dir)<CR>", { desc = "cd into config" })

-- PLUGINS --
map("n", "<leader>pl", ":Lazy<CR>", { desc = "Plugins: Lazy" })

-- cd into nixos config
if vim.g.os_id == "nixos" then
    dotfiles_dir = vim.fn.getenv("HOME") .. "/.dotfiles"
    map("n", "<leader><", ":lua vim.cmd('cd' .. dotfiles_dir)<CR>", { desc = "cd into dotfiles" })
end

-- Language-specific--
local M = require("user.config.keymaps")
for lang, bindings in pairs(M.langs) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = lang,
        callback = function()
            for _, binding in ipairs(bindings) do
                map("n", binding[1], binding[2], { desc = binding.desc })
            end
        end
    })
end
