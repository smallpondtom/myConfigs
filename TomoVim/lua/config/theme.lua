-- Setting up colorschemes for nvim

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true

require('monokai').setup {}
require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }

-- Detect whether it is WSL or pure linux
local is_wsl = vim.api.nvim_exec([[
  function! Is_WSL() abort
    let proc_version = '/proc/version'
    return filereadable(proc_version)
          \  ? !empty(filter(
          \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
          \  : v:false
  endfunction

  echo Is_WSL()
]], true)

if os then -- when Linux
  if is_wsl=="1" then  -- if WSL
    vim.cmd[[colorscheme monokai]]
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
  elseif is_wsl=="0" then -- if pure Linux
    vim.cmd[[colorscheme gruvbox]]
  else
    print("Not valid -> requires debugging.")
  end
else -- if windows or Mac
  print("I hate MacOS. Use Linux.")
end

--[[ require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
} ]]

vim.cmd("hi clear LineNr")
vim.cmd("hi clear SignColumn")
