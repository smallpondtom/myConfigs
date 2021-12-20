-- Setting up colorschemes for nvim

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true

require('monokai').setup {}
require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }

vim.cmd[[colorscheme monokai_soda]]

--[[ require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
} ]]

