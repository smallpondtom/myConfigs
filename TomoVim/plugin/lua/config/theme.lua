local status_ok, _ = pcall(require, "monokai")
if not status_ok then
  return
end

math.randomseed(os.time())

-- Setting up colorschemes for nvim
vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
]])

-- Sonokai
local sonokai_styles = { "default", "atlantis", "andromeda", "shusia", "maia", "espresso" }
local sonokai_style = sonokai_styles[math.random(1, #sonokai_styles)]
vim.g.sonokai_style = sonokai_style
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1

-- Tokyonight
local tokyonight_styles = { "night", "storm" }
local tokyonight_style = tokyonight_styles[math.random(1, #tokyonight_styles)]
vim.g.tokyonight_style = tokyonight_style
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true

-- Monokai
require("monokai").setup({})
require("monokai").setup({ palette = require("monokai").pro })
require("monokai").setup({ palette = require("monokai").soda })

-- Everforest
local everForest_styles = { "hard", "medium", "soft" }
local everForest_style = everForest_styles[math.random(1, #everForest_styles)]
vim.g.everForest_background = everForest_style

-- Detect whether it is WSL or pure linux
local is_wsl = vim.api.nvim_exec(
	[[
  function! Is_WSL() abort
    let proc_version = '/proc/version'
    return filereadable(proc_version)
          \  ? !empty(filter(
          \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
          \  : v:false
  endfunction

  echo Is_WSL()
]],
	true
)

-- Random selection of best colorschemes (for WSL)
local best_colorschemes = {
	"duskfox",
	"gruvbox",
	"monokai",
	"nightfly",
	"nightfox",
	"nordfox",
	"tokyonight",
	"sonokai",
	"everforest",
  "kanagawa"
}

-- Chose a random one
local rand_colorscheme = best_colorschemes[math.random(1, #best_colorschemes)]

if os then -- when Linux
	if is_wsl == "1" then -- if WSL
		vim.cmd("colorscheme "..rand_colorscheme)
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi clear LineNr")
    vim.cmd("hi clear SignColumn")
    vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
	elseif is_wsl == "0" then -- if pure Linux
		vim.cmd([[colorscheme gruvbox]])
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

