local opt = vim.opt

vim.opt.guifont = "Iosevka Term:h11"

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.termguicolors = true
opt.cursorline = true
opt.showmatch = true

opt.splitbelow = true
opt.splitright = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.cmdheight = 0

opt.updatetime = 250
opt.timeoutlen = 400

opt.completeopt = { "menu", "menuone", "noselect" }
opt.hidden = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"

vim.api.nvim_set_hl(0, "CursorLine", {
  underline = true,
})

