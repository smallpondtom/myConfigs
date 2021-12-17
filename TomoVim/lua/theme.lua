-- Setting up colorschemes for nvim

vim.cmd[[colorscheme tokyonight]]

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}

vim.g.tokyonight_style = "dark"
