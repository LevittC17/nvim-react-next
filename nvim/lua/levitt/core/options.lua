-- Make Nvim File Explorer use Tree Style
vim.cmd("let g:netrw_liststyle = 3")

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs and spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

-- Search settings
vim.opt.ignorecase = true
vim.smartcase = true

vim.opt.cursorline = true

-- turn on termguicolors for colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.background = "dark"
vim.signcolumn = "yes"

-- backspace
vim.opt.clipboard:append("unnamedplus")

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
