-- Lazy.nvim setup
require("config.lazy")

-- General settings
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.swapfile = false
-- vim.opt.cursorline = true

-- Line number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%{v:relnum > 0 && v:relnum <= 9 ? v:relnum : v:lnum}"

-- Automatic line breaking settings
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

-- Tabulation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Text encoding and indentation settings
vim.g.mapleader = " "
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true

-- Keymaps
-- Move line up
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { silent = true, noremap = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })

-- Move line down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { silent = true, noremap = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- Diagnostic icons for neo-tree plugin
vim.diagnostic.config({
    signs = true,
})
