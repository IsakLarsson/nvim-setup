local opt = vim.opt -- for conciseness

opt.confirm = true
-- line numbers
opt.relativenumber = true
opt.number = true
opt.scrolloff = 10

opt.fillchars = "eob: "
-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settins
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
-- cursor line
opt.cursorline = true
opt.showtabline = 2
-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.syntax = "ON"
opt.showmode = false
-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
