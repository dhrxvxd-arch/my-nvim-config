local opt = vim.opt

local font = {
  "Iosevka Nerd Font:h12",
  "CaskaydiaMono Nerd Font:h12",
  "JetBrainsMono Nerd Font:h12",
  "Ubuntu Mono:h14",
}

opt.guifont = font[1]
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }

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

vim.opt.cursorline = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "WinEnter" }, {
  callback = function()
    if vim.bo.filetype == "neo-tree" then
      vim.opt_local.cursorline = false
    end
  end,
})

