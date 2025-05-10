local o = vim.opt
local g = vim.g

if g.neovide then
    vim.g.neovide_scale_factor = 1.05
end

-- lines
o.relativenumber = true
o.number = true
o.scrolloff = 8

-- tabs & indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = false

-- line wrapping
o.wrap = true

-- search settings
o.ignorecase = true
o.smartcase = true

-- cursor line
o.cursorline = true

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"
o.colorcolumn = "80"

-- lsp menu
o.pumheight = 10

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true

o.iskeyword:append("-")

vim.g.acd = true

local function get_os_id()
  local os_release = vim.fn.readfile('/etc/os-release')
  for _, line in ipairs(os_release) do
    if line:match('^ID=(.+)') then
      return line:match('^ID=(.+)')
    end
  end

  return "unknown"
end
vim.g.os_id = get_os_id()
