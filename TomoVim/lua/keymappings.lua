vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "E", "ge", { noremap = true, silent = true })

-- highlight
vim.api.nvim_set_keymap("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- Explorer
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Window Navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Esc Insert Mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap("n", "<Leader><TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- SnipRun
vim.api.nvim_set_keymap("v", "<C-s>", "<Plug>SnipRun<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>SnipRun<CR>", { silent = true })

-- CD
vim.api.nvim_set_keymap("n", "<C-d>", ":cd %:p:h<CR>:pwd<CR>", { noremap = true, silent = true })
