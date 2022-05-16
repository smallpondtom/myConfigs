vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.smartcase = true

vim.wo.signcolumn = 'yes'
vim.o.incsearch = false
vim.o.number = true
vim.wo.number = true
vim.o.background = "dark"
vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.cmd("set encoding=UTF-8")
vim.cmd("set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis")
vim.go.hidden = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.go.timeoutlen = 100
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 100

vim.opt.autochdir = true
--vim.opt.clipboard = "unnamedplus"
vim.cmd("set clipboard+=unnamedplus")
vim.opt.mouse = "a"
vim.opt.cmdheight = 2
vim.opt.showtabline = 2
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.showmode = true
vim.opt.wrap = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.opt.cursorline = true
vim.cmd("highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold")
vim.cmd("hi Cursorline guifg=red guibg=blue")
