vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'


vim.opt.signcolumn = 'yes'
vim.opt.equalalways = true
vim.o.wrap = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.syntax = 'on'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.showmode = false
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.o.ruler = true
vim.o.title = true
vim.o.hidden = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.o.showmatch = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.o.splitbelow = "splitright"
vim.inccommand = 'split'

vim.ttimeoutlen = 0
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.o.wildmenu = true
vim.opt.pumblend = 5
vim.o.termguicolors = true
vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus' -- Required dependecies. In my wayland is 'wl-clipboard' or in ubuntu is 'xclip'

vim.opt.mouse = "a"
vim.opt.ea = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
